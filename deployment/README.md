# Deployment plan (not deployed)

1. Validate feature consistency between training and inference.
2. Save the fitted preprocessing + model pipeline as a versioned artifact.
3. Test local batch scoring and document expected input schema.
4. Optional: register artifact with Vertex AI Model Registry.
5. Optional: use a compatible prebuilt serving container or custom Docker image and deploy to Vertex AI Endpoint.
6. Set billing alerts, restrict access, test endpoint, and delete resources when finished to avoid costs.
7. Monitor data quality, score distributions, latency, and delayed fraud outcomes.

**Vertex AI deployment can incur charges.** Do not deploy without reviewing costs.
