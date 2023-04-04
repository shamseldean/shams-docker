# FROM node:14
FROM node:14 as base
FROM base as development
WORKDIR /app
COPY package.json .
ARG NODE_ENV
RUN npm install
COPY . .
EXPOSE 4000
CMD [ "npm","run","start-dev" ]

FROM base as production
WORKDIR /app
COPY package.json .
RUN npm install --only=production
COPY . .
EXPOSE 4000
CMD [ "npm","start" ]
#  RUN if ["NODE_ENV"="development"];\
#     then npm install;\
#     else npm istall --only=production; \
#     fi
# FROM node:14
# WORKDIR /app
# COPY package.json .
# ARG NODE_ENV
# RUN if ["NODE_ENV" = "production"];\
#     then npm install --only=production;\
#     else npm install;\
#     fi
# COPY . .
# EXPOSE 4000
# CMD [ "npm","run","start-dev" ]