FROM node:20-alpine

WORKDIR /app

COPY package*.json ./
RUN npm install

# 复制所有文件
COPY . .

# === 重要：完全绕过有问题的 start.sh 脚本 ===
# RUN chmod +x /app/start.sh
# ENTRYPOINT ["/app/start.sh"]

# 改为直接用Node启动你的应用
CMD ["node", "server.js"]

# 暴露应用端口（与server.js中一致）
EXPOSE 3000
