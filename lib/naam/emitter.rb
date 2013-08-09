module Naam
  # Helper methods that output PIR code to the console.
  module Emitter

    # Output the main procedure.
    #
    # series - An Array of String.
    #
    # Examples
    #
    #   Emitter.main(["foo(4)", "bar(-1)"]
    #   # => .sub main :main
    #   # =>     .local int f
    #   # =>     f = foo(4)
    #   # =>     say f
    #   # =>     f = bar(-1)
    #   # =>     say f
    #   # => .end
    #
    # Returns nothing.
    def self.main(series)
      unless series.empty?
        puts
        puts ".sub main :main"
        puts "    .local int f"
        series.each do |str|
          puts "    f = #{str}"
          puts "    say f"
        end
        puts ".end"
      end
    end

    # Dispatch different kind of emit message.
    #
    # type   - A Symbol in :function_header, :function_footer,
    #          :if_clause, :else_clause and :label.
    # series - An Array of LexicalUnit.
    # label  - Hash like { label: "NAME", value: "123" }. Could be nil.
    #
    # Returns nothing.
    def self.emit(type, series, label)
      case type
      when :function_header then function_header(series)
      when :function_footer then function_footer
      when :if_clause then if_clause(series, label)
      when :else_clause then else_clause(series)
      when :label then label(series, label)
      else
        raise Error
      end
    end

    def self.function_header(series)
      puts ".sub " + series[0].value
      puts "    .param int " + series[2].value
      puts "    .local int result"
      puts
    end

    def self.function_footer
      puts "RETURN:"
      puts "    .return(result)"
      puts ".end"
    end

    def self.if_clause(series, label)
      puts "    if #{series[2].value} #{series[3].value} #{series[4].value} " +
           "goto #{label[:label]}"
    end

    def self.else_clause(series)
      puts "    result = #{series[0].value}"
      puts "    goto RETURN"
    end

    def self.label(series, label)
      puts label[:label] + ":"
      puts "    result = #{label[:value]}"
      puts "    goto RETURN"
    end

  end
end
