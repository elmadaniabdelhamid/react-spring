  FROM node:lts-alpine
  WORKDIR /app
  COPY package*.json ./
  RUN if [ -f package-lock.json ] || [ -f npm-shrinkwrap.json ]; then         npm ci --omit=dev;       else         npm install --omit=dev;       fi
  COPY . .
  EXPOSE 3000
  CMD ["npm","start"]
