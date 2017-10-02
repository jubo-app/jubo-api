# our base image
FROM node:8-alpine

EXPOSE 5000

CMD ["npm", "start"]