{{/*
Expand the name of the chart.
*/}}
{{- define "directus.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "directus.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "directus.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "directus.labels" -}}
helm.sh/chart: {{ include "directus.chart" . }}
{{ include "directus.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "directus.selectorLabels" -}}
app.kubernetes.io/name: {{ include "directus.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

# Directus Auth providers
## add sso if enabled
## add local if enabled
{{- define "directus.authProviders" -}}
{{- $directusAuthProviders := list -}}
{{- if .Values.config.auth.admin.enabled -}}
{{- $directusAuthProviders = append $directusAuthProviders "local" -}}
{{- end -}}
{{- range $k, $v := .Values.config.auth.sso -}}
{{- if $v.enabled -}}
{{- $directusAuthProviders = append $directusAuthProviders $k -}}
{{- end -}}
{{- end -}}
{{- join "," $directusAuthProviders -}}
{{- end -}}

# Directus Storage Locations
## add local if enabled
## add remote options if enabled
{{- define "directus.storageLocations" -}}
{{- $directusStorageLocations := list -}}
{{- if .Values.config.storage.local.enabled -}}
{{- $directusStorageLocations = append $directusStorageLocations "local" -}}
{{- end -}}
{{- range $k, $v := .Values.config.storage.remote -}}
{{- if $v.enabled -}}
{{- $directusStorageLocations = append $directusStorageLocations $k -}}
{{- end -}}
{{- end -}}
{{- join "," $directusStorageLocations -}}
{{- end -}}
