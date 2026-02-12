# 🏗️ System Architecture

## Overview

MedMail Intelligence Platform is a full-stack application built with a modern, scalable architecture that separates concerns between frontend, backend, and data layers.

## Architecture Diagram

```
┌─────────────────────────────────────────────────────────────────┐
│                         Client Layer                            │
├─────────────────────────────────────────────────────────────────┤
│  React Frontend (Port 5173)                                     │
│  ┌──────────────┐  ┌──────────────┐  ┌──────────────┐        │
│  │  Components  │  │   Services   │  │    State     │        │
│  │   (UI/UX)    │  │  (API Calls) │  │  Management  │        │
│  └──────────────┘  └──────────────┘  └──────────────┘        │
└─────────────────────────────────────────────────────────────────┘
                              │
                         HTTPS/REST API
                              │
┌─────────────────────────────────────────────────────────────────┐
│                      Application Layer                          │
├─────────────────────────────────────────────────────────────────┤
│  FastAPI Backend (Port 8000)                                    │
│  ┌──────────┐  ┌──────────┐  ┌──────────┐  ┌──────────┐      │
│  │  Routes  │  │ Services │  │Middleware│  │  Utils   │      │
│  └──────────┘  └──────────┘  └──────────┘  └──────────┘      │
│                                                                 │
│  ┌────────────────┐  ┌────────────────┐  ┌────────────────┐  │
│  │ Authentication │  │ Email Service  │  │  AI Service    │  │
│  │   (JWT/OAuth)  │  │  (Gmail API)   │  │   (GPT-4)      │  │
│  └────────────────┘  └────────────────┘  └────────────────┘  │
└─────────────────────────────────────────────────────────────────┘
                              │
                    ┌─────────┴─────────┐
                    │                   │
┌───────────────────┴─────┐  ┌──────────┴───────────────────────┐
│      Data Layer         │  │    External Services             │
├─────────────────────────┤  ├──────────────────────────────────┤
│  PostgreSQL Database    │  │  OpenAI API (GPT-4)             │
│  ┌───────────────────┐  │  │  Gmail API (OAuth2)             │
│  │  Users            │  │  │  FAISS Vector Store             │
│  │  Emails           │  │  └──────────────────────────────────┘
│  │  Embeddings       │  │
│  │  Search History   │  │
│  └───────────────────┘  │
└─────────────────────────┘
```

## Component Architecture

### Frontend Architecture

```
src/
├── api/                    # API Client Layer
│   ├── client.ts          # Axios instance with interceptors
│   ├── auth.ts            # Authentication API calls
│   ├── emails.ts          # Email operations
│   ├── analytics.ts       # Analytics endpoints
│   └── queries.ts         # RAG query endpoints
│
├── components/            # React Components
│   ├── ui/               # shadcn/ui base components
│   ├── Hero.tsx          # Landing page
│   ├── Dashboard.tsx     # Main dashboard
│   ├── Analytics.tsx     # Analytics view
│   └── AIAssistant.tsx   # Chat interface
│
├── pages/                # Route pages
│   ├── Home.tsx
│   ├── Login.tsx
│   ├── Register.tsx
│   └── Settings.tsx
│
├── hooks/                # Custom React hooks
│   ├── useAuth.ts       # Authentication hook
│   ├── useEmails.ts     # Email data hook
│   └── useAnalytics.ts  # Analytics hook
│
├── stores/              # State management (Zustand)
│   ├── authStore.ts
│   └── emailStore.ts
│
├── types/               # TypeScript definitions
│   └── index.ts
│
└── lib/                 # Utilities
    └── utils.ts
```

### Backend Architecture

```
backend/app/
├── main.py                 # FastAPI application entry
│
├── core/                   # Core configuration
│   └── config.py          # Environment settings
│
├── db/                     # Database layer
│   ├── database.py        # SQLAlchemy setup
│   └── models.py          # ORM models
│
├── routes/                 # API endpoints
│   ├── auth_routes.py     # /api/auth/*
│   ├── email_routes.py    # /api/emails/*
│   ├── analytics_routes.py # /api/analytics/*
│   └── query_routes.py    # /api/query/*
│
├── services/              # Business logic
│   ├── gmail_service.py   # Gmail API integration
│   ├── ai_categorizer.py  # GPT-4 categorization
│   ├── rag_service.py     # Vector search
│   └── seed_data.py       # Demo data generation
│
├── middleware/            # Request/response processing
│   ├── security.py        # CORS, headers
│   └── rate_limit.py      # Rate limiting
│
└── utils/                 # Utilities
    ├── pdf_parser.py      # PDF processing
    └── summarizer.py      # Text summarization
```

## Data Flow

### Email Categorization Flow

```
User Action: "Categorize Email"
     │
     ↓
Frontend: API Call to /api/emails/categorize
     │
     ↓
Backend: email_routes.py receives request
     │
     ↓
Backend: Validates request & checks auth
     │
     ↓
Backend: Calls ai_categorizer.py service
     │
     ↓
External: GPT-4 API call with email content
     │
     ↓
Backend: Receives category & entities
     │
     ↓
Backend: Updates database (emails table)
     │
     ↓
Backend: Returns response to frontend
     │
     ↓
Frontend: Updates UI with new category
```

### RAG Query Flow

```
User Query: "Show urgent emails from today"
     │
     ↓
Frontend: API Call to /api/query/
     │
     ↓
Backend: query_routes.py receives request
     │
     ↓
Backend: Calls rag_service.py
     │
     ├─→ Generate query embedding (OpenAI)
     │
     ├─→ Search FAISS vector store
     │
     └─→ Retrieve matching emails
     │
     ↓
Backend: Rank and filter results
     │
     ↓
Backend: Return results to frontend
     │
     ↓
Frontend: Display results in UI
```

### Gmail Sync Flow

```
User Action: "Sync from Gmail"
     │
     ↓
Frontend: API Call to /api/emails/sync
     │
     ↓
Backend: Checks Gmail OAuth token
     │
     ├─→ Token valid? Continue
     └─→ Token expired? Redirect to OAuth
     │
     ↓
Backend: gmail_service.py fetches emails
     │
     ↓
External: Gmail API returns email list
     │
     ↓
Backend: For each email:
     │
     ├─→ Store in database
     ├─→ Generate embedding (OpenAI)
     ├─→ Store embedding in FAISS
     └─→ Optionally categorize (GPT-4)
     │
     ↓
Backend: Return sync summary
     │
     ↓
Frontend: Update email list
```

## Database Schema

### Users Table
```sql
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    email VARCHAR(255) UNIQUE NOT NULL,
    hashed_password VARCHAR(255) NOT NULL,
    full_name VARCHAR(255),
    gmail_token TEXT,
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW()
);
```

### Emails Table
```sql
CREATE TABLE emails (
    id SERIAL PRIMARY KEY,
    user_id INTEGER REFERENCES users(id),
    gmail_id VARCHAR(255) UNIQUE,
    sender VARCHAR(255),
    recipient VARCHAR(255),
    subject TEXT,
    body TEXT,
    category VARCHAR(100),
    entities JSONB,
    received_date TIMESTAMP,
    is_read BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT NOW()
);
```

### Embeddings Table
```sql
CREATE TABLE embeddings (
    id SERIAL PRIMARY KEY,
    email_id INTEGER REFERENCES emails(id),
    embedding VECTOR(1536),
    created_at TIMESTAMP DEFAULT NOW()
);
```

### Search History Table
```sql
CREATE TABLE search_history (
    id SERIAL PRIMARY KEY,
    user_id INTEGER REFERENCES users(id),
    query TEXT NOT NULL,
    results_count INTEGER,
    created_at TIMESTAMP DEFAULT NOW()
);
```

## Security Architecture

### Authentication Flow
```
1. User submits credentials (email/password)
2. Backend validates against database
3. Backend generates JWT token with expiration
4. Frontend stores token in memory/localStorage
5. Frontend includes token in Authorization header
6. Backend validates token on each request
7. Token expires after configured time
```

### OAuth2 Flow (Gmail)
```
1. User clicks "Connect Gmail"
2. Frontend redirects to /api/auth/gmail/authorize
3. Backend redirects to Google OAuth consent
4. User approves access
5. Google redirects to callback URL with code
6. Backend exchanges code for access/refresh tokens
7. Backend stores tokens encrypted in database
8. Backend associates tokens with user
```

## Scalability Considerations

### Horizontal Scaling
- **Frontend**: Can be deployed to multiple CDN nodes
- **Backend**: Stateless design allows multiple instances
- **Database**: PostgreSQL supports replication and sharding

### Caching Strategy
- **Frontend**: React Query for data caching
- **Backend**: Redis can be added for API caching
- **Vector Store**: FAISS supports distributed search

### Performance Optimization
- **Lazy Loading**: Components loaded on demand
- **Pagination**: API returns paginated results
- **Batch Processing**: Bulk operations for efficiency
- **Async Operations**: Background tasks for heavy operations

## Technology Stack Justification

### Why React?
- Component-based architecture
- Large ecosystem and community
- Excellent TypeScript support
- Virtual DOM for performance

### Why FastAPI?
- High performance (async support)
- Automatic API documentation
- Type hints and validation
- Modern Python features

### Why PostgreSQL?
- ACID compliance
- JSON support (for entities)
- Vector extension support
- Proven reliability

### Why FAISS?
- Fast similarity search
- Production-ready
- Scalable to billions of vectors
- Industry standard

## Deployment Architecture

### Development
```
Local Machine
├── Frontend: Vite dev server (5173)
├── Backend: Uvicorn with reload (8000)
└── Database: Local PostgreSQL (5432)
```

### Production
```
Cloud Infrastructure
├── Frontend: CDN (Vercel/Netlify)
├── Backend: Container (AWS ECS/GCP Cloud Run)
├── Database: Managed PostgreSQL (AWS RDS/GCP Cloud SQL)
└── Vector Store: Persistent volume
```

## Monitoring & Observability

### Logging
- **Frontend**: Console logging + error tracking (Sentry)
- **Backend**: Structured logging with timestamps
- **Database**: Query logging for optimization

### Metrics
- API response times
- Error rates
- Email processing throughput
- AI API usage and costs

### Health Checks
- `/health` endpoint for backend
- Database connection check
- External service availability

## Future Architecture Improvements

1. **Microservices**: Split into dedicated services (auth, email, AI)
2. **Message Queue**: Add Redis/RabbitMQ for async processing
3. **Caching Layer**: Redis for frequently accessed data
4. **Load Balancer**: Nginx/AWS ALB for traffic distribution
5. **Auto-scaling**: Kubernetes for container orchestration
6. **Real-time Updates**: WebSockets for live notifications
7. **Search Engine**: Elasticsearch for full-text search
8. **Object Storage**: S3 for email attachments

---

**Version**: 1.0  
**Last Updated**: February 2024
