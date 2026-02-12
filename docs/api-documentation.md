# 🔌 API Documentation

## Base URL

```
Development: http://localhost:8000
Production: https://api.medmail-intelligence.com
```

## Authentication

All protected endpoints require a JWT token in the Authorization header:

```http
Authorization: Bearer <your_jwt_token>
```

---

## Authentication Endpoints

### Register User

**POST** `/api/auth/register`

Create a new user account.

**Request Body:**
```json
{
  "email": "user@example.com",
  "password": "SecurePassword123!",
  "full_name": "John Doe"
}
```

**Response:** `201 Created`
```json
{
  "id": 1,
  "email": "user@example.com",
  "full_name": "John Doe",
  "created_at": "2024-02-12T10:00:00Z"
}
```

**Errors:**
- `400`: Email already exists
- `422`: Validation error

---

### Login

**POST** `/api/auth/login`

Authenticate user and receive JWT token.

**Request Body:**
```json
{
  "email": "user@example.com",
  "password": "SecurePassword123!"
}
```

**Response:** `200 OK`
```json
{
  "access_token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...",
  "token_type": "bearer",
  "user": {
    "id": 1,
    "email": "user@example.com",
    "full_name": "John Doe"
  }
}
```

**Errors:**
- `401`: Invalid credentials

---

### Gmail Authorization

**GET** `/api/auth/gmail/authorize`

Initiate Gmail OAuth2 flow.

**Response:** `302 Redirect`
- Redirects to Google OAuth consent screen

---

### Gmail Callback

**GET** `/api/auth/gmail/callback`

OAuth2 callback endpoint.

**Query Parameters:**
- `code`: Authorization code from Google
- `state`: Security state parameter

**Response:** `200 OK`
```json
{
  "message": "Gmail connected successfully",
  "email": "user@gmail.com"
}
```

---

## Email Endpoints

### List Emails

**GET** `/api/emails/`

Get paginated list of user's emails.

**Query Parameters:**
- `skip` (int, default=0): Number of records to skip
- `limit` (int, default=20): Maximum records to return
- `category` (str, optional): Filter by category
- `is_read` (bool, optional): Filter by read status

**Response:** `200 OK`
```json
{
  "total": 150,
  "skip": 0,
  "limit": 20,
  "emails": [
    {
      "id": 1,
      "gmail_id": "18d4f7e8c9a2b1f0",
      "sender": "doctor@hospital.com",
      "recipient": "user@example.com",
      "subject": "Lab Results Available",
      "body": "Your recent lab results are now available...",
      "category": "Diagnostic Results",
      "entities": {
        "patient_names": ["John Doe"],
        "dates": ["2024-02-10"],
        "medical_terms": ["blood test", "cholesterol"]
      },
      "received_date": "2024-02-10T14:30:00Z",
      "is_read": false,
      "created_at": "2024-02-10T14:35:00Z"
    }
  ]
}
```

---

### Get Single Email

**GET** `/api/emails/{email_id}`

Get details of a specific email.

**Path Parameters:**
- `email_id` (int): Email ID

**Response:** `200 OK`
```json
{
  "id": 1,
  "gmail_id": "18d4f7e8c9a2b1f0",
  "sender": "doctor@hospital.com",
  "subject": "Lab Results Available",
  "body": "Full email body text...",
  "category": "Diagnostic Results",
  "entities": {
    "patient_names": ["John Doe"],
    "dates": ["2024-02-10"],
    "amounts": [],
    "medical_terms": ["blood test"]
  },
  "received_date": "2024-02-10T14:30:00Z",
  "is_read": false,
  "summary": "Lab results show normal cholesterol levels."
}
```

**Errors:**
- `404`: Email not found
- `403`: Access denied

---

### Sync Emails from Gmail

**POST** `/api/emails/sync`

Sync emails from connected Gmail account.

**Request Body:**
```json
{
  "max_results": 100,
  "query": "in:inbox after:2024/01/01"
}
```

**Response:** `200 OK`
```json
{
  "synced_count": 45,
  "new_emails": 12,
  "updated_emails": 33,
  "errors": 0,
  "duration_seconds": 15.3
}
```

**Errors:**
- `401`: Gmail not connected
- `500`: Gmail API error

---

### Categorize Email

**POST** `/api/emails/{email_id}/categorize`

Categorize a single email using AI.

**Path Parameters:**
- `email_id` (int): Email ID

**Response:** `200 OK`
```json
{
  "email_id": 1,
  "category": "Diagnostic Results",
  "confidence": 0.95,
  "entities": {
    "patient_names": ["John Doe"],
    "dates": ["2024-02-10"],
    "medical_terms": ["blood test", "cholesterol"]
  }
}
```

---

### Bulk Categorize

**POST** `/api/emails/bulk-categorize`

Categorize multiple emails at once.

**Request Body:**
```json
{
  "email_ids": [1, 2, 3, 4, 5],
  "force_recategorize": false
}
```

**Response:** `200 OK`
```json
{
  "total": 5,
  "successful": 5,
  "failed": 0,
  "results": [
    {
      "email_id": 1,
      "category": "Diagnostic Results",
      "status": "success"
    }
  ]
}
```

---

### Search Emails

**GET** `/api/emails/search`

Advanced email search with filters.

**Query Parameters:**
- `q` (str): Search query
- `category` (str): Filter by category
- `sender` (str): Filter by sender
- `date_from` (date): Start date (YYYY-MM-DD)
- `date_to` (date): End date (YYYY-MM-DD)
- `is_read` (bool): Read status

**Response:** `200 OK`
```json
{
  "query": "diagnostic",
  "total_results": 25,
  "emails": [...]
}
```

---

## Query Endpoints (RAG)

### Natural Language Query

**POST** `/api/query/`

Search emails using natural language.

**Request Body:**
```json
{
  "query": "Show urgent emails from cardiology this week",
  "max_results": 10
}
```

**Response:** `200 OK`
```json
{
  "query": "Show urgent emails from cardiology this week",
  "results": [
    {
      "email_id": 15,
      "subject": "Urgent: Patient Follow-up",
      "sender": "cardiology@hospital.com",
      "relevance_score": 0.92,
      "snippet": "...urgent follow-up required for patient..."
    }
  ],
  "total_results": 3,
  "processing_time_ms": 245
}
```

---

### Semantic Search

**POST** `/api/query/semantic`

Semantic similarity search.

**Request Body:**
```json
{
  "query": "insurance claims pending approval",
  "threshold": 0.7,
  "max_results": 5
}
```

**Response:** `200 OK`
```json
{
  "query": "insurance claims pending approval",
  "results": [
    {
      "email_id": 42,
      "similarity_score": 0.89,
      "email": {...}
    }
  ]
}
```

---

## Analytics Endpoints

### Dashboard Overview

**GET** `/api/analytics/overview`

Get dashboard statistics.

**Query Parameters:**
- `days` (int, default=30): Time period in days

**Response:** `200 OK`
```json
{
  "total_emails": 523,
  "unread_emails": 47,
  "categories": {
    "Diagnostic Results": 125,
    "Insurance Claims": 89,
    "Appointment Confirmations": 76,
    "Billing": 65,
    "Other": 168
  },
  "trends": {
    "daily_volume": [
      {"date": "2024-02-01", "count": 18},
      {"date": "2024-02-02", "count": 22}
    ]
  },
  "top_senders": [
    {"sender": "doctor@hospital.com", "count": 45},
    {"sender": "billing@hospital.com", "count": 32}
  ]
}
```

---

### Category Distribution

**GET** `/api/analytics/categories`

Get email distribution by category.

**Response:** `200 OK`
```json
{
  "categories": [
    {
      "name": "Diagnostic Results",
      "count": 125,
      "percentage": 23.9
    },
    {
      "name": "Insurance Claims",
      "count": 89,
      "percentage": 17.0
    }
  ],
  "total_categorized": 523,
  "uncategorized": 12
}
```

---

### Email Trends

**GET** `/api/analytics/trends`

Get email volume trends over time.

**Query Parameters:**
- `period` (str): "daily", "weekly", "monthly"
- `days` (int, default=30): Number of days

**Response:** `200 OK`
```json
{
  "period": "daily",
  "data": [
    {
      "date": "2024-02-01",
      "total": 18,
      "by_category": {
        "Diagnostic Results": 5,
        "Insurance Claims": 3,
        "Other": 10
      }
    }
  ]
}
```

---

### Entity Statistics

**GET** `/api/analytics/entities`

Get statistics on extracted entities.

**Response:** `200 OK`
```json
{
  "total_entities_extracted": 1247,
  "entity_types": {
    "patient_names": 325,
    "dates": 412,
    "amounts": 189,
    "medical_terms": 321
  },
  "top_medical_terms": [
    {"term": "blood test", "count": 45},
    {"term": "cholesterol", "count": 32}
  ]
}
```

---

## Error Responses

All endpoints may return these error responses:

### 400 Bad Request
```json
{
  "detail": "Invalid request parameters"
}
```

### 401 Unauthorized
```json
{
  "detail": "Not authenticated"
}
```

### 403 Forbidden
```json
{
  "detail": "Not enough permissions"
}
```

### 404 Not Found
```json
{
  "detail": "Resource not found"
}
```

### 422 Validation Error
```json
{
  "detail": [
    {
      "loc": ["body", "email"],
      "msg": "field required",
      "type": "value_error.missing"
    }
  ]
}
```

### 429 Too Many Requests
```json
{
  "detail": "Rate limit exceeded. Try again in 60 seconds."
}
```

### 500 Internal Server Error
```json
{
  "detail": "Internal server error"
}
```

---

## Rate Limiting

- **Authenticated Users**: 100 requests/minute
- **Unauthenticated**: 20 requests/minute
- **AI Operations**: 10 requests/minute

**Rate Limit Headers:**
```http
X-RateLimit-Limit: 100
X-RateLimit-Remaining: 95
X-RateLimit-Reset: 1644678000
```

---

## Pagination

List endpoints support pagination:

**Request:**
```http
GET /api/emails/?skip=20&limit=20
```

**Response includes:**
```json
{
  "total": 150,
  "skip": 20,
  "limit": 20,
  "has_more": true,
  "data": [...]
}
```

---

## Filtering & Sorting

Many endpoints support filtering and sorting:

**Filters:**
```http
GET /api/emails/?category=Diagnostic+Results&is_read=false
```

**Sorting:**
```http
GET /api/emails/?sort_by=received_date&order=desc
```

---

## Interactive API Documentation

Visit these URLs while the backend is running:

- **Swagger UI**: http://localhost:8000/api/docs
- **ReDoc**: http://localhost:8000/api/redoc
- **OpenAPI JSON**: http://localhost:8000/openapi.json

---

## Code Examples

### Python (requests)
```python
import requests

# Login
response = requests.post(
    "http://localhost:8000/api/auth/login",
    json={"email": "user@example.com", "password": "password"}
)
token = response.json()["access_token"]

# Get emails
headers = {"Authorization": f"Bearer {token}"}
emails = requests.get(
    "http://localhost:8000/api/emails/",
    headers=headers
).json()
```

### JavaScript (fetch)
```javascript
// Login
const response = await fetch('http://localhost:8000/api/auth/login', {
  method: 'POST',
  headers: { 'Content-Type': 'application/json' },
  body: JSON.stringify({
    email: 'user@example.com',
    password: 'password'
  })
});
const { access_token } = await response.json();

// Get emails
const emails = await fetch('http://localhost:8000/api/emails/', {
  headers: { 'Authorization': `Bearer ${access_token}` }
}).then(res => res.json());
```

### cURL
```bash
# Login
TOKEN=$(curl -X POST "http://localhost:8000/api/auth/login" \
  -H "Content-Type: application/json" \
  -d '{"email":"user@example.com","password":"password"}' \
  | jq -r '.access_token')

# Get emails
curl -X GET "http://localhost:8000/api/emails/" \
  -H "Authorization: Bearer $TOKEN"
```

---

**Version**: 1.0  
**Last Updated**: February 2024
