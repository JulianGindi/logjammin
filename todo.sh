# Simple Note-taking and Todo

export NOTES=~/Dropbox/Notes
export TODO=~/Dropbox/Todo
function note() {
    if (( $# == 0 )) then ls $NOTES;
    elif [[ $1 == "new" ]]; then vi $NOTES/"$2.txt";
    elif [[ $1 == "peek" ]]; then find $NOTES -iname "${@:2}*" -exec head {} \;;
    elif [[ $1 == "find" ]]; then ls $NOTES | grep -i ${@:2};
    elif [[ $1 == "rm" ]]; then cd $NOTES && ls | grep -i ${@:2} | head -n1 | xargs rm && cd -
    elif [[ $1 == "old" ]]; then ls -tr $NOTES | head -n 20
      else find $NOTES -iname "$@*" -exec vi {} \;; fi
}

function todo() {
  if (( $# == 0)) then printTodo;
  elif [[ $1 == "now" && $# == 1 ]]; then cat $TODO/now.txt;
  elif [[ $1 == "later" && $# == 1 ]]; then cat $TODO/later.txt;
  elif [[ $1 == "now" && $2 == "edit" ]]; then vi $TODO/now.txt;
  elif [[ $1 == "later" && $2 == "edit" ]]; then vi $TODO/later.txt;
  elif [[ $1 == "now" ]]; then echo "• ${@:2}" >> $TODO/now.txt
    printTodo;
  elif [[ $1 == "later" ]]; then echo "• ${@:2}" >> $TODO/later.txt
    printTodo;
  elif [[ $1 == "done" ]]; then sed -i -e "/${@:2}/d" $TODO/now.txt
      sed -i -e "/${@:2}/d" $TODO/later.txt
      printTodo; fi;
}

function printTodo() {
  awk 'FNR==NR{
  {print;} next;}
  {{print;};next}' $TODO/now.txt $TODO/later.txt
}

# Auto Complete for Notes

_note_list() {
  reply=(`ls $NOTES`)
}
compctl -K _note_list note
