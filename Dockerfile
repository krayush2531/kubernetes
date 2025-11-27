FROM node:20-alpine AS BASE

WORKDIR /app

COPY package*.json package-lock.json* ./

RUN npm ci --omit=dev

COPY . .
USER node
EXPOSE 3000
ENV NODE_ENV=production
CMD ["npm", "start"]
