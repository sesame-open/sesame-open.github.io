docker run --rm --volume="$($PWD):/srv/jekyll" -p 4000:4000 --name jekyll-serve -d jekyll/jekyll:stable jekyll serve --incremental --livereload --force_polling
docker logs -f jekyll-serve

Write-Host "`nStopping container:"
docker stop jekyll-serve