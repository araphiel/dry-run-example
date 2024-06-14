#/bin/bash

publishedPackages=$(echo "$PUBLISHED_PACKAGES" | jq -c '.[]')

for pkg in $publishedPackages; do
    pkgName=$(echo "$pkg" | jq -r '.name')
    pkgVersion=$(echo "$pkg" | jq -r '.version')
    tag="${pkgName}@${pkgVersion}"
    packageName=$(echo "$pkgName" | sed 's/@.*\///')
    zipFileName="${packageName}.zip"
    filePath="./packages/${packageName}/${zipFileName}"

    if [[ -f "$filePath" ]]; then
        echo "Uploading $filePath to release $tag"
        gh release upload $tag $filePath --clobber
    else
        echo "File not found: $filePath"
    fi
done