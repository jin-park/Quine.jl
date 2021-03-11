module Quine
    export generate_quine
    function escape(string)
        string = replace(string, "\\" => "\\\\")
        return replace(string, "\"" => "\\\"")
    end
    
    function generate_quine(n)
        variable_names = collect('a':'z')
        lines = []
        if n > 26
            println("sorry only supports 26 variables max because of variable name")
            println("...and because the author's lazy :p")
        elseif n == 1
            println("a = :(println(\"a = :(\" * string(a) * \"); eval(a)\"); eval(a)")
            return
        end
        push!(lines, "a = :(eval(b))")
        push!(lines, "b = :(eval(c); println(\"a = :(eval(b))\\neval(a)\"))")
        for i in 3:n - 1
            previous_string = escape(lines[i - 1])
            push!(lines, "$(variable_names[i]) = :(eval($(variable_names[i + 1])); println(\"$(previous_string)\"))")
        end
        last_string = escape(lines[n - 1])
        push!(lines, "$(variable_names[n]) = :(println(\"$(variable_names[n]) = :(\" * string($(variable_names[n])) * \")\\n$(last_string)\"))")
        for i in n:-1:1
            println(lines[i])
        end
        println("eval(a)")
    end
end
