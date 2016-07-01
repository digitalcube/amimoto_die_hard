BLANCHES='
  default-hiphop-amimoto
  default-hvm-amimoto
  default-modphp-amimoto
  default-pvm-amimoto
  default-woo-hhvm-amimoto
  default-woo-hvm-amimoto
  default-woo-modphp-amimoto
'

for branch in $BLANCHES; do
 git checkout $branch
 git merge master
 git push origin $branch
done

git checkout master
