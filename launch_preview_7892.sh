docker run --rm -itp 7892:8080 -p 3002:3001 -v ./content:/usr/src/app/content $(docker build -q .)
