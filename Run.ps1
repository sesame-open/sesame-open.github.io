if ((docker ps | Out-String).Contains('jekyll-serve')) {
    Write-Host "jekyll-serve is already running" -ForegroundColor Yellow
    Write-Host "Stopping current container..." -ForegroundColor Yellow

    docker stop jekyll-serve | Out-Null
    Write-Host "Container stopped" -ForegroundColor Yellow
}

Write-Host "Starting container jekyll-serve..." -ForegroundColor Yellow
docker run --rm --volume="$($PWD):/srv/jekyll" -p 4000:4000 --name jekyll-serve -d jekyll/jekyll:stable jekyll serve --incremental --livereload --force_polling | Out-Null
docker logs -f jekyll-serve

Write-Host "`nStopping container..." -ForegroundColor Yellow
docker stop jekyll-serve | Out-Null

Write-Host "Container stopped" -ForegroundColor Yellow