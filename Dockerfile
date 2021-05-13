FROM node:alpine
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build
# build will be located in /app/build, because we are in /app and build will create a new build folder

# a new phase. A phase can only have one FROM clause
FROM nginx
COPY --from=0 /app/build /usr/share/nginx/html
# I am assuming that the 0 indicates the first phase in the file (zero indexed)
 