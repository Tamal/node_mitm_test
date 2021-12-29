FROM node:14-alpine
WORKDIR /app
COPY package.json package-lock.json ./
# Set proxy before calling `npm ci`
# RUN npm config set strict-ssl false
# RUN npm config set https-proxy http://127.0.0.1:8080
ARG HTTP_PROXY
ARG HTTPS_PROXY
ARG CA
ENV HTTP_PROXY=${HTTP_PROXY}
ENV HTTPS_PROXY=${HTTPS_PROXY}
ENV CA=${CA}
RUN npm config set registry http://registry.npmjs.org/
RUN npm config set strict-ssl false
RUN npm config set proxy ${HTTP_PROXY}
RUN npm config set https-proxt ${HTTPS_PROXY}
RUN npm config set ca ${CA}
RUN npm ci

FROM node:14-alpine
WORKDIR /app
COPY --from=0 /app .
COPY . .

EXPOSE 3002

CMD ["npm", "start"]
