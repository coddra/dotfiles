set -g process_start_time unset
set -g process_start_ms unset
function fish_right_prompt -d 'Write out the right prompt'
    if test $process_start_time != unset
        printf %s (set_color cyan)
        set -l time_spent $(expr $(date +%s) - $process_start_time)
        if test $(expr $time_spent / 3600) -gt 0
            printf "%sh " $(expr $time_spent / 3600)
        end
        if test $(expr $time_spent / 60) -gt 0
            printf "%sm " $(expr $time_spent / 60 % 60)
        end
	if test $time_spent -gt 0
            printf "%ss" $(expr $time_spent % 60)
        else
            if test $process_start_ms != unset
                printf "%sms" $(expr $process_start_ms)
            end
        end
        printf %s (set_color normal)
    end
end

function set_start_time -e fish_preexec -d 'Sets the start time of a process'
    set -g process_start_time $(date +%s)
    set -g process_start_ms $(expr $(date +%N) / 1000000)
end
