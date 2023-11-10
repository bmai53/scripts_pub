HELP_STRING="\n\tusage:\t$0 -a FLAG_A -b FLAG_B"

printHelpStringAndExit() {
    # -e flag uses escape characters
    echo -e $HELP_STRING
    exit 0
}

# add ":" after flag if input is required
while getopts a:b:h flag
do
    case "${flag}" in
        a) flagA=${OPTARG};;
        b) flagB=${OPTARG};;
        h) printHelpStringAndExit ;;
        *) printHelpStringAndExit ;;
    esac
done

echo "flagA: $flagA, flagB: $flagB"
