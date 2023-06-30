{{/*
Compute the checksum of the rendered ConfigMap.
*/}}
{{- define "chart.checksumConfigMap" }}
{{- (include (print $.Template.BasePath "/configmap.yaml") . | sha256sum) | trunc 16 }}
{{- end }}

