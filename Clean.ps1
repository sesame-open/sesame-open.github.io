if ((docker ps | Out-String).Contains('jekyll-serve')) {
    Write-Host "jekyll-serve is already running" -ForegroundColor Yellow
    Write-Host "Stopping current container..." -ForegroundColor Yellow

    docker stop jekyll-serve | Out-Null
    Write-Host "Container stopped" -ForegroundColor Yellow
}

docker run --rm --volume="$($PWD):/srv/jekyll" -it jekyll/jekyll:stable jekyll clean