BLANCHES='
  default-hvm-amimoto
  default-modphp-amimoto
  default-woo-hvm-amimoto
  default-woo-modphp-amimoto
  default-autoscale-amimoto
'

for branch in $BLANCHES; do
 git checkout $branch
 git merge main
 git push origin $branch
done

git checkout main
