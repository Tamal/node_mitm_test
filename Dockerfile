FROM node:14-alpine
WORKDIR /app
COPY package.json package-lock.json ./
RUN npm ci

FROM node:14-alpine
WORKDIR /app
COPY --from=0 /app .
COPY . .

EXPOSE 3002

CMD ["npm", "start"]
