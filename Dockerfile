# our base image
FROM node:8-alpine

ENV APP_DIR "/opt/app"
ENV TMP_DIR "/var${APP_DIR}"
ENV NODE_ENV "development"
ENV PORT "3000"

RUN apk --no-cache add curl

RUN mkdir "$APP_DIR"
RUN mkdir "$TMP_DIR"

WORKDIR "$TMP_DIR"

COPY ./package.json "./package.json"
RUN npm install

WORKDIR "$APP_DIR"

COPY . .
RUN mv "${TMP_DIR}/node_modules" ./node_modules

HEALTHCHECK CMD curl --fail "http://localhost:${PORT}/ping" || exit 1

CMD ["npm", "start"]