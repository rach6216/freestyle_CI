ARG NODE_VERSION=18
# Stage 1: Install dependencies
FROM node:${NODE_VERSION}-alpine AS build
WORKDIR /usr/src/app
RUN npm install --quiet --cache-dir /usr/src/app/node_modules
# Stage 2: Copy code and start app
FROM build
EXPOSE 4000
ENV NODE_ENV development
COPY . .
CMD node index.js