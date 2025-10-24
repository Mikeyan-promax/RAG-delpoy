# Railway Environment Variables Configuration

## 必需的环境变量 (Required Variables)

### 服务器配置 (Server Configuration)
```
HOST=0.0.0.0
PORT=8080
WEBUI_TITLE=My Graph KB
WEBUI_DESCRIPTION=Simple and Fast Graph Based RAG System
```

### LLM配置 (LLM Configuration)
```
LLM_BINDING=openai
LLM_MODEL=deepseek-chat
LLM_BINDING_HOST=https://api.deepseek.com
LLM_BINDING_API_KEY=sk-9189176321ae486c8f755145b59299eb
OPENAI_API_KEY=sk-9189176321ae486c8f755145b59299eb
TIMEOUT=240
```

### 嵌入模型配置 (Embedding Configuration)
```
EMBEDDING_BINDING=openai
EMBEDDING_MODEL=doubao-embedding-text-240715
EMBEDDING_DIM=2560
EMBEDDING_BINDING_API_KEY=6674bc28-fc4b-47b8-8795-bf79eb01c9ff
EMBEDDING_BINDING_HOST=https://ark.cn-beijing.volces.com/api/v3
```

### 数据库配置 (Database Configuration)
```
LIGHTRAG_KV_STORAGE=PGKVStorage
LIGHTRAG_DOC_STATUS_STORAGE=PGDocStatusStorage
LIGHTRAG_GRAPH_STORAGE=PGGraphStorage
LIGHTRAG_VECTOR_STORAGE=PGVectorStorage

POSTGRES_HOST=pgm-2ze58b40mdfqec4zwo.pg.rds.aliyuncs.com
POSTGRES_PORT=5432
POSTGRES_USER=lightrag_db
POSTGRES_PASSWORD=LightRAG2024!@#
POSTGRES_DATABASE=lightrag_production
POSTGRES_MAX_CONNECTIONS=12
```

### 性能配置 (Performance Configuration)
```
MAX_ASYNC=4
MAX_PARALLEL_INSERT=2
ENABLE_LLM_CACHE=true
ENABLE_LLM_CACHE_FOR_EXTRACT=true
SUMMARY_LANGUAGE=English
```

## 可选环境变量 (Optional Variables)
```
OLLAMA_EMULATING_MODEL_TAG=latest
```

## Railway部署注意事项 (Railway Deployment Notes)

1. **端口配置**: Railway会自动分配端口，但我们设置PORT=8080作为默认值
2. **数据库**: 使用外部PostgreSQL数据库（阿里云RDS）
3. **API密钥**: 确保所有API密钥都正确配置
4. **存储**: 使用PostgreSQL作为所有存储后端，适合云部署

## 配置步骤 (Configuration Steps)

1. 在Railway项目中进入Variables选项卡
2. 逐一添加上述必需的环境变量
3. 确保所有API密钥和数据库连接信息正确
4. 保存配置并重新部署