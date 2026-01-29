#!/bin/sh

# 1. 设置环境变量
export PORT=${PORT:-3000}
export TMDB_API_KEY=${TMDB_API_KEY:-}
export ADMIN_PASSWORD=${ADMIN_PASSWORD:-}

# 2. 替换 index.html 中的 TMDB_API_KEY
if [ -n "$TMDB_API_KEY" ]; then
    echo "正在注入 TMDB_API_KEY 到前端文件..."
    sed -i "s|const TMDB_API_KEY = \".*\";|const TMDB_API_KEY = \"$TMDB_API_KEY\";|g" /app/public/index.html
fi

# 3. 替换 server.js 中的 ADMIN_PASSWORD
if [ -n "$ADMIN_PASSWORD" ]; then
    echo "正在注入 ADMIN_PASSWORD 到后端文件..."
    sed -i "s|const ADMIN_PASSWORD = \".*\";|const ADMIN_PASSWORD = \"$ADMIN_PASSWORD\";|g" /app/server.js
fi

# 4. 启动应用（使用正确的参数格式）
echo "应用启动在端口: $PORT"
exec node server.js
