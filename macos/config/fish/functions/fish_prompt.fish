function fish_prompt
    set_color $fish_color_cwd
    echo -n (set_color --bold blue)'['(set_color --bold white)'shashi'(set_color brred)'@'(set_color --bold white)'mac'(set_color --bold blue)']'(set_color green) (prompt_pwd) (set_color green)'   '
end
