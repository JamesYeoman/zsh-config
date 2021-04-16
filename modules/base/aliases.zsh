aliasi=()
pushd "${ZMODDIR}" > /dev/null
for file in aliases/*; do
  aliasi+=( "${file%.*}" )
done
popd > /dev/null

for subject in $aliasi; do
    loadModule $subject
done
