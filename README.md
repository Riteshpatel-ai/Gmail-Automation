# 🏥 MedMail Intelligence Platform

[![License](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![FastAPI](https://img.shields.io/badge/FastAPI-0.109.0-009688.svg)](https://fastapi.tiangolo.com/)
[![React](https://img.shields.io/badge/React-18.3-61DAFB.svg)](https://react.dev/)
[![TypeScript](https://img.shields.io/badge/TypeScript-5.8-3178C6.svg)](https://www.typescriptlang.org/)
[![Python](https://img.shields.io/badge/Python-3.9+-3776AB.svg)](https://www.python.org/)
[![Build Status](https://img.shields.io/badge/Build-Passing-success)]()

> 🚀 Transform hospital email chaos into actionable insights with AI-powered automation

An intelligent email management system specifically designed for healthcare professionals, combining Gmail integration, GPT-4 categorization, vector search, and real-time analytics to streamline medical communication workflows.

---

## 📸 Project Showcase

> **Note**: Screenshots will be added soon. See [docs/screenshots/](docs/screenshots/) for guidelines.

<div align="center">
  <!-- Screenshot placeholder - add actual screenshots here -->
  <p><em>📊 Intelligent email dashboard with real-time analytics</em></p>
  <p><em>🔍 Natural language search with AI-powered RAG</em></p>
  <p><em>📈 Interactive analytics and trend visualization</em></p>
</div>

---

## 🌟 Key Features

### 🤖 AI-Powered Intelligence
- **Smart Categorization**: GPT-4 automatically classifies emails into medical categories
- **Entity Extraction**: Automatically extracts patient names, dates, amounts, and medical terms
- **Natural Language Search**: Query emails using conversational language with RAG technology
- **Email Summarization**: AI-generated summaries for quick understanding

### 📧 Email Management
- **Gmail OAuth2 Integration**: Secure connection to Gmail accounts
- **Real-time Sync**: Automatic email synchronization
- **Advanced Filtering**: Multi-criteria search and filtering
- **Bulk Operations**: Process multiple emails efficiently

### 📊 Analytics & Insights
- **Real-time Dashboards**: Interactive visualizations using Recharts
- **Trend Analysis**: Email volume, category distribution, response times
- **Smart Alerts**: Automated notifications for critical emails
- **Performance Metrics**: Track team response times and workload

### 🔐 Security & Compliance
- **JWT Authentication**: Secure user sessions
- **OAuth2 Integration**: Google-authenticated email access
- **Data Encryption**: Secure storage of sensitive information
- **Audit Logging**: Complete activity tracking

---

## 🛠️ Tech Stack

### Frontend Architecture
| Technology | Version | Purpose |
|------------|---------|---------|
| **React** | 18.3 | UI framework with hooks and modern patterns |
| **TypeScript** | 5.8 | Type-safe development |
| **Vite** | 5.4 | Lightning-fast build tool |
| **Tailwind CSS** | 3.4 | Utility-first styling |
| **shadcn/ui** | Latest | 50+ professional UI components |
| **React Query** | 5.83 | Server state management |
| **Zustand** | 5.0 | Client state management |
| **Recharts** | 2.15 | Data visualization |
| **Axios** | 1.7 | HTTP client |

### Backend Architecture
| Technology | Version | Purpose |
|------------|---------|---------|
| **FastAPI** | 0.109 | High-performance Python framework |
| **PostgreSQL** | Latest | Production database |
| **SQLAlchemy** | 2.0 | ORM for database operations |
| **OpenAI GPT-4** | Latest | AI categorization and summarization |
| **LangChain** | Latest | RAG implementation framework |
| **FAISS** | Latest | Vector similarity search |
| **Gmail API** | v1 | Email integration |
| **SpaCy** | 3.7 | NLP entity extraction |
| **PyJWT** | Latest | Authentication tokens |

### DevOps & Tools
- **Docker** + **Docker Compose**: Containerization
- **Uvicorn**: ASGI server
- **GitHub Actions**: CI/CD (planned)
- **pytest**: Backend testing
- **ESLint**: Code quality

---

## 📂 Repository Structure

```
Gmail-Automation/
├── 📁 backend/                    # FastAPI Backend Service
│   ├── app/
│   │   ├── main.py               # Application entry point
│   │   ├── core/
│   │   │   └── config.py        # Environment & settings
│   │   ├── db/
│   │   │   ├── models.py        # SQLAlchemy models
│   │   │   └── database.py      # DB connection
│   │   ├── routes/              # API endpoints
│   │   │   ├── auth_routes.py   # Authentication
│   │   │   ├── email_routes.py  # Email operations
│   │   │   ├── analytics_routes.py
│   │   │   └── query_routes.py  # RAG search
│   │   ├── services/            # Business logic
│   │   │   ├── gmail_service.py # Gmail API wrapper
│   │   │   ├── ai_categorizer.py # GPT-4 integration
│   │   │   ├── rag_service.py   # Vector search
│   │   │   └── seed_data.py     # Demo data
│   │   ├── middleware/          # Security & rate limiting
│   │   └── utils/               # Helpers
│   ├── requirements.txt         # Python dependencies
│   ├── Dockerfile              # Backend container
│   └── .env.example            # Environment template
│
├── 📁 src/                       # React Frontend Application
│   ├── api/                     # API client layer
│   ├── components/              # React components
│   │   ├── Hero.tsx            # Landing page
│   │   ├── Dashboard.tsx       # Main dashboard
│   │   ├── Analytics.tsx       # Analytics views
│   │   ├── AIAssistant.tsx     # Chat interface
│   │   └── ui/                 # shadcn components
│   ├── pages/                   # Route pages
│   ├── hooks/                   # Custom React hooks
│   ├── types/                   # TypeScript definitions
│   ├── lib/                     # Utilities
│   ├── App.tsx                 # Root component
│   └── main.tsx                # Entry point
│
├── 📁 docs/                      # Comprehensive Documentation
│   ├── architecture.md          # System architecture
│   ├── setup-guide.md          # Detailed setup
│   ├── tech-stack.md           # Technology details
│   ├── api-documentation.md    # API reference
│   └── screenshots/            # Project images
│
├── 📁 .github/                   # GitHub Configuration
│   ├── workflows/              # CI/CD pipelines
│   ├── ISSUE_TEMPLATE/         # Issue templates
│   └── PULL_REQUEST_TEMPLATE.md
│
├── 📁 scripts/                   # Setup & utility scripts
│   ├── setup.sh                # Linux/Mac setup
│   ├── setup.ps1               # Windows setup
│   └── start.ps1               # Quick start script
│
├── docker-compose.yml           # Multi-container orchestration
├── package.json                # Node dependencies
├── tsconfig.json               # TypeScript config
├── tailwind.config.ts          # Tailwind configuration
├── vite.config.ts              # Vite build config
├── LICENSE                     # MIT License
├── CONTRIBUTING.md             # Contribution guidelines
├── CODE_OF_CONDUCT.md          # Community standards
└── SECURITY.md                 # Security policy

```

---

## 🚀 Quick Start

### Prerequisites
- **Node.js**: >= 16.0.0 ([Download](https://nodejs.org/))
- **npm**: >= 8.0.0 (comes with Node.js)
- **Python**: >= 3.9 ([Download](https://www.python.org/))
- **PostgreSQL**: >= 13 ([Download](https://www.postgresql.org/)) or use Docker
- **Git**: Latest version
- **Docker** (Optional): For containerized deployment

### Option 1: Docker Setup (Recommended) 🐳

**Perfect for quick demos and production deployment**

```bash
# 1. Clone the repository
git clone https://github.com/Riteshpatel-ai/Gmail-Automation.git
cd Gmail-Automation

# 2. Configure environment
cp backend/.env.example backend/.env
# Edit backend/.env with your API keys

# 3. Start all services
docker-compose up -d

# 4. Access the application
# Frontend: http://localhost:8080
# Backend API: http://localhost:8000
# API Docs: http://localhost:8000/api/docs
```

### Option 2: Manual Setup 🛠️

**Best for development and customization**

#### Windows
```powershell
# Run automated setup
.\scripts\setup.ps1

# Or manually start services:
# Backend setup
cd backend
python -m venv venv
.\venv\Scripts\Activate
pip install -r requirements.txt
copy .env.example .env
# Edit .env with your credentials
uvicorn app.main:app --reload

# Frontend setup (new terminal)
npm install
npm run dev
```

#### Linux/Mac
```bash
# Run automated setup
chmod +x scripts/setup.sh
./scripts/setup.sh

# Or manually start services:
# Backend setup
cd backend
python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt
cp .env.example .env
# Edit .env with your credentials
uvicorn app.main:app --reload

# Frontend setup (new terminal)
npm install
npm run dev
```

### 🔑 Environment Configuration

Create `backend/.env` with the following:

```env
# OpenAI Configuration
OPENAI_API_KEY=sk-your-openai-api-key

# Gmail API Configuration
GMAIL_CLIENT_ID=your-client-id.apps.googleusercontent.com
GMAIL_CLIENT_SECRET=your-client-secret
GMAIL_REDIRECT_URI=http://localhost:8000/api/auth/gmail/callback

# Database Configuration
DATABASE_URL=postgresql://postgres:password@localhost:5432/medmail
# Or for SQLite (development):
# DATABASE_URL=sqlite:///./medmail.db

# Security
SECRET_KEY=your-super-secret-jwt-key-change-this-in-production
ALGORITHM=HS256
ACCESS_TOKEN_EXPIRE_MINUTES=30

# Application
ENVIRONMENT=development
DEBUG=true
```

### 🎯 First Run

Once everything is running:

1. **Open Frontend**: Navigate to `http://localhost:5173`
2. **Register Account**: Create your first user account
3. **Connect Gmail**: Authorize Gmail access via OAuth2
4. **Sync Emails**: Click "Sync from Gmail" to import emails
5. **Explore Features**: Try categorization, search, and analytics

---

## 📖 Documentation

### 📚 Complete Guides
- [**🏗️ Architecture Overview**](docs/architecture.md) - System design and data flow
- [**🔧 Setup Guide**](docs/setup-guide.md) - Detailed installation instructions
- [**📚 Tech Stack Details**](docs/tech-stack.md) - In-depth technology explanations
- [**🔌 API Documentation**](docs/api-documentation.md) - Complete API reference
- [**🤝 Contributing Guidelines**](CONTRIBUTING.md) - How to contribute
- [**🔐 Security Policy**](SECURITY.md) - Security best practices

### 🚀 API Documentation
Interactive API documentation available at:
- **Swagger UI**: http://localhost:8000/api/docs
- **ReDoc**: http://localhost:8000/api/redoc

### 🎓 Key Concepts
- **RAG (Retrieval-Augmented Generation)**: Natural language email search using vector embeddings
- **Email Categorization**: GPT-4 classification into healthcare categories
- **Entity Extraction**: NLP-based extraction of medical entities
- **Vector Search**: FAISS-powered similarity search

---

## 🎯 Key API Endpoints

### Authentication
```http
POST /api/auth/register        # Register new user
POST /api/auth/login           # User login (returns JWT)
POST /api/auth/gmail/authorize # Start Gmail OAuth flow
GET  /api/auth/gmail/callback  # Gmail OAuth callback
```

### Email Operations
```http
POST /api/emails/sync          # Sync emails from Gmail
GET  /api/emails/              # List all emails (paginated)
GET  /api/emails/{id}          # Get single email details
POST /api/emails/categorize    # Categorize emails with AI
POST /api/emails/bulk-categorize # Bulk categorization
```

### Search & Query
```http
POST /api/query/               # Natural language search
POST /api/query/semantic       # Semantic similarity search
GET  /api/emails/search        # Advanced filtering
```

### Analytics
```http
GET  /api/analytics/overview   # Dashboard overview stats
GET  /api/analytics/trends     # Email trends over time
GET  /api/analytics/categories # Category distribution
GET  /api/analytics/entities   # Extracted entities summary
```

---

## 💡 Usage Examples

### Natural Language Queries

```javascript
// Example queries you can ask:
"Show urgent diagnostic results from last week"
"All insurance claims above $5000 from this month"
"Patient messages from cardiology department"
"Unread appointment confirmations"
"Bills pending payment from January"
```

### Email Categories

The system automatically categorizes emails into:
- 🩺 Doctor/Patient Communication
- 🔬 Diagnostic Results & Lab Reports
- 💰 Insurance Claims
- 💳 Billing & Payment Information
- 📅 Appointment Confirmations
- 📋 Medical Reports & Records
- 🏥 Hospital Notices
- 💊 Pharmacy & Prescriptions
- 🚨 Emergency Notifications
- 📞 General Inquiries

---

## 🧪 Testing

### Backend Tests
```bash
cd backend
pytest tests/ -v
pytest tests/ --cov=app --cov-report=html
```

### Frontend Tests
```bash
npm run test
npm run test:coverage
```

### Integration Tests
```bash
# Coming soon
npm run test:integration
```

---

## 🐳 Docker Deployment

### Build Images
```bash
# Build backend
docker build -t medmail-backend ./backend

# Build frontend
docker build -t medmail-frontend .
```

### Run with Docker Compose
```bash
# Start all services
docker-compose up -d

# View logs
docker-compose logs -f

# Stop services
docker-compose down

# Rebuild and start
docker-compose up -d --build
```

### Production Deployment
```bash
# Use production docker-compose
docker-compose -f docker-compose.prod.yml up -d
```

---

## 🗺️ Roadmap

### ✅ Completed
- [x] Gmail OAuth2 integration
- [x] AI email categorization with GPT-4
- [x] Vector search with FAISS
- [x] Real-time analytics dashboard
- [x] Entity extraction
- [x] JWT authentication
- [x] Docker containerization
- [x] Professional UI with shadcn/ui

### 🚧 In Progress
- [ ] Frontend-backend integration
- [ ] Unit test coverage (>80%)
- [ ] CI/CD pipeline with GitHub Actions
- [ ] Performance optimization

### 🔮 Planned
- [ ] Mobile responsive design
- [ ] Email templates library
- [ ] Advanced reporting features
- [ ] Multi-language support
- [ ] Calendar integration
- [ ] SMS notifications
- [ ] Advanced AI features (sentiment analysis)
- [ ] Export functionality (PDF, CSV)
- [ ] Role-based access control (RBAC)
- [ ] Audit trail enhancements

---

## 🐛 Troubleshooting

### Common Issues

**Issue**: Backend fails to start
- **Solution**: Check Python version (>=3.9), verify .env configuration, ensure PostgreSQL is running

**Issue**: Frontend cannot connect to backend
- **Solution**: Verify backend is running on port 8000, check CORS settings in backend

**Issue**: Gmail OAuth not working
- **Solution**: Verify GMAIL_CLIENT_ID and GMAIL_CLIENT_SECRET in .env, check redirect URI configuration

**Issue**: AI categorization fails
- **Solution**: Verify OPENAI_API_KEY is valid and has credits, check API rate limits

**Issue**: Database connection errors
- **Solution**: Verify DATABASE_URL format, ensure PostgreSQL service is running, check credentials

For more issues, see [Troubleshooting Guide](docs/setup-guide.md#troubleshooting)

---

## 🤝 Contributing

We welcome contributions! Please follow these steps:

1. **Fork the repository**
2. **Create a feature branch**: `git checkout -b feature/amazing-feature`
3. **Make your changes** following our coding standards
4. **Run tests**: Ensure all tests pass
5. **Commit changes**: `git commit -m 'Add amazing feature'`
6. **Push to branch**: `git push origin feature/amazing-feature`
7. **Open a Pull Request**

See [CONTRIBUTING.md](CONTRIBUTING.md) for detailed guidelines.

---

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

```
MIT License - Copyright (c) 2024 Ritesh Patel

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files...
```

---

## 👤 Author

**Ritesh Patel**

- 🐙 **GitHub**: [@Riteshpatel-ai](https://github.com/Riteshpatel-ai)
- 💼 **LinkedIn**: [Connect on LinkedIn](https://linkedin.com/in/ritesh-patel)
- 🌐 **Portfolio**: [riteshpatel.dev](https://riteshpatel.dev)
- 📧 **Email**: ritesh@example.com

---

## 🙏 Acknowledgments

- **OpenAI** - GPT-4 API for intelligent categorization
- **Google** - Gmail API for email integration
- **FastAPI** - High-performance web framework
- **shadcn/ui** - Beautiful UI components
- **React Community** - Excellent ecosystem
- **Healthcare Professionals** - Domain insights and feedback

---

## 📊 Project Stats

![GitHub stars](https://img.shields.io/github/stars/Riteshpatel-ai/Gmail-Automation?style=social)
![GitHub forks](https://img.shields.io/github/forks/Riteshpatel-ai/Gmail-Automation?style=social)
![GitHub issues](https://img.shields.io/github/issues/Riteshpatel-ai/Gmail-Automation)
![GitHub pull requests](https://img.shields.io/github/issues-pr/Riteshpatel-ai/Gmail-Automation)
![Last commit](https://img.shields.io/github/last-commit/Riteshpatel-ai/Gmail-Automation)

---

## ⭐ Show Your Support

If this project helped you, please give it a ⭐️! It helps others discover the project.

---

<div align="center">
  <p><strong>Built with ❤️ for healthcare professionals</strong></p>
  <p>Making medical communication intelligent, efficient, and accessible</p>
  
  <br/>
  
  <p>
    <a href="https://github.com/Riteshpatel-ai/Gmail-Automation/issues">Report Bug</a>
    ·
    <a href="https://github.com/Riteshpatel-ai/Gmail-Automation/issues">Request Feature</a>
    ·
    <a href="docs/setup-guide.md">Documentation</a>
  </p>
</div>
