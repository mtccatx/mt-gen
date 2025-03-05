#!/bin/sh
# Generate a moontower of some given length of segments in ASCII art

NUM_SEGMENTS="$1"

print_usage() {
    echo "Moontower Generator - created by Dylan Turner"
    echo "Usage: $0 NUM_SEGMENTS"
}
verify_args() {
    if [ $# -ne 1 ]; then
        echo "Wrong number of arguments passed into script: $#\n"
        print_usage
        exit 1
    fi
    if [ -z "$NUM_SEGMENTS" ]; then
        echo "No value for number of segments to generate\n"
        print_usage
        exit 1
    fi
    if ! echo "$NUM_SEGMENTS" | grep -Eq '^[0-9]+$'; then
        echo "Invalid value for number of segments - NaN\n"
        print_usage
        exit 1
    fi
    if [ $NUM_SEGMENTS -lt 1 ]; then
        echo "Number of segments must be >0\n"
        print_usage
        exit 1
    fi
}

draw_top() {
    echo '    O\ /O'
    echo '/-----+-----\'
    echo 'O / / | \ \ O'
    echo '  |O /|\ O|'
    echo '  | / | \ |'
    echo '  \/  |  \/'
    echo '   ---+---'
}
draw_segment() {
    echo '  | _-|-_ |'
    echo '  |/__|__\|'
    echo '  |   |   |'
}
draw_base() {
    echo '  |-------|'
    echo '   \ | | /'
    echo '    \| |/'
    echo '     | |'
    echo '     | |'
    echo '     | |'
    echo '     | |'
}

verify_args $@
draw_top
for i in $(seq 1 "$NUM_SEGMENTS"); do
    draw_segment
done
draw_base

