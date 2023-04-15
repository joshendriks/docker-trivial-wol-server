FROM node:10
RUN mkdir -p /app
WORKDIR /app
RUN npm install trivial-wol-server
WORKDIR /app/node_modules/trivial-wol-server/
CMD node trivial_wol_d.js
EXPOSE 30000
