{{/*
Expand the name of the chart.
*/}}
{{- define "laravel-app.app.name" -}}
{{ include "laravel-app.name" . }}-app
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "laravel-app.app.fullname" -}}
{{ include "laravel-app.fullname" . }}-app
{{- end }}

{{/*
Selector labels
*/}}
{{- define "laravel-app.app.selectorLabels" -}}
app.kubernetes.io/name: {{ include "laravel-app.app.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "laravel-app.app.serviceAccountName" -}}
{{- if .Values.app.serviceAccount.create }}
{{- default (include "laravel-app.app.fullname" .) .Values.app.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.app.serviceAccount.name }}
{{- end }}
{{- end }}
