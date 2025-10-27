FROM node:25.0.0-alpine AS build
WORKDIR /app

COPY package*.json ./
RUN npm ci
COPY . .
RUN npm run build

FROM nginx:1.29.2-alpine
WORKDIR /usr/share/nginx/html

COPY --from=build /app/dist ./
COPY nginx.conf /etc/nginx/nginx.conf

RUN addgroup -g 1001 -S team4 && \
    adduser -S team4 -u 1001

RUN chown -R team4:team4 /usr/share/nginx/html && \
    chown -R team4:team4 /var/cache/nginx && \
    chown -R team4:team4 /var/log/nginx && \
    chown -R team4:team4 /run

USER team4

EXPOSE 8080

HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=5 \
  CMD curl -f http://localhost:8080/health || exit 1

CMD ["nginx", "-g", "daemon off;"]
