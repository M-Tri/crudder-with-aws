## Week 2 — Distributed Tracing

#### Set up Honeycomb for Backend (OpenTelemetry)

- **Set environment variables:**  
  Configure your service name and Honeycomb API key in your environment:  
```bash
export SERVICE_NAME="your-service-name"
export HONEYCOMB_API_KEY="your-honeycomb-api-key"
````

* **Install requirements:**
Install the necessary Python packages:

```bash
pip install -r requirements.txt
```

* **Add the following imports to your `app.py`:**

```python
from opentelemetry import trace
from opentelemetry.instrumentation.flask import FlaskInstrumentor
from opentelemetry.instrumentation.requests import RequestsInstrumentor
from opentelemetry.exporter.otlp.proto.http.trace_exporter import OTLPSpanExporter
from opentelemetry.sdk.trace import TracerProvider
from opentelemetry.sdk.trace.export import BatchSpanProcessor
```
#### Initialize tracing and an exporter that can send data to Honeycomb
provider = TracerProvider()
processor = BatchSpanProcessor(OTLPSpanExporter())
provider.add_span_processor(processor)
trace.set_tracer_provider(provider)
tracer = trace.get_tracer(__name__)

#### Initialize Flask app and automatic instrumentation
app = Flask(__name__)
FlaskInstrumentor().instrument_app(app)
RequestsInstrumentor().instrument()

#### Instrumentation with OpenTelemetry

To get started with OpenTelemetry in Python, follow the official guide:

👉 [OpenTelemetry Python - Getting Started](https://opentelemetry.io/docs/languages/python/getting-started/)

### About Volumes and Docker Images

If your Dockerfile uses `COPY . .` to include source code during build, the image contains all your app code and dependencies. Running the container **without mounting volumes** works perfectly using the baked-in code.

**Volumes are only needed for live editing** during development. Without volumes, local code changes won’t reflect inside the container unless you rebuild the image.

**TL;DR:**  
- ❌ Remove the volume → live changes won’t show up  
- ✔️ Container runs using the built-in code inside the image  
- 🔹 Volumes are **not needed** unless you want live code updates during development
