{{/*
Expand the name of the chart.
*/}}
{{- define "laravel-app.db.name" -}}
{{ include "laravel-app.name" . }}-db
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "laravel-app.db.fullname" -}}
{{ include "laravel-app.fullname" . }}-db
{{- end }}

{{/*
Selector labels
*/}}
{{- define "laravel-app.db.selectorLabels" -}}
app.kubernetes.io/name: {{ include "laravel-app.db.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "laravel-app.db.serviceAccountName" -}}
{{- if .Values.db.serviceAccount.create }}
{{- default (include "laravel-app.db.fullname" .) .Values.db.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.db.serviceAccount.name }}
{{- end }}
{{- end }}
