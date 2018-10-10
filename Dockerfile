FROM golang:1.11-alpine AS build-env
ADD . /src
RUN cd /src && go build -o main


FROM alpine
WORKDIR /app
COPY --from=build-env /src/main /app/
CMD /app/main