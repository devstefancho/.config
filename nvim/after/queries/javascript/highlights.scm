;; extends

((import_statement) @test.import.import (#set! "priority" 101))

; Functional Component 이름부분
([
 "export"
 "default"
 "function"
] @test.component_name_line (#set! "priority" 150))

((identifier) @test.component_name_line
  (#eq? @test.component_name_line "Counter"))


; useState 부분
((lexical_declaration) @test.use_state (#set! "priority" 102))


; handleClick 부분
((function_declaration
   name: (identifier) @test.function_counter_name
    (#eq? @test.function_counter_name "handleClick")
   parameters: (formal_parameters)
   ) @test.function_handle_click (#set! "priority" 150))
(#eq? @test.function_handle_click "handleClick")


; return 부분
((return_statement) @test.return_statement (#set! "priority" 101))
