# Custom error pages for Traefik (rewrited with Hugo)

## Motivation

As [original project](https://github.com/guillaumebriday/traefik-custom-error-pages) is deprecated and not maintenable (I wanted to build it and Ruby dependancies throw an error), I decided to carry the project with [Hugo](https://gohugo.io/) :)

## Getting started

docker run -d -p 8000:80 tchoupinax/traefik-custom-error-pages

## Development

You have to [install](https://gohugo.io/getting-started/quick-start/) hugo on your environment.

For development and watching changes

```
hugo serve -w
```

For building 

```
hugo
```

## How to use with Traefik

The complete [documentation](https://doc.traefik.io/traefik/middlewares/http/errorpages)

```yaml
apiVersion: traefik.containo.us/v1alpha1
kind: Middleware
metadata:
  name: errorpage
spec:
  errors:
    status:
      - 400-600
    query: /{status}/
    service:
      name: traefik-custom-error-pages
      port: 80
```

## Built with

- [Hugo](https://gohugo.io/) - The world’s fastest framework for building websites

## Credits

This project is forked from [this](https://github.com/guillaumebriday/traefik-custom-error-pages) project.

## Licence

This project is released under the [MIT](https://opensource.org/licenses/MIT) license.
