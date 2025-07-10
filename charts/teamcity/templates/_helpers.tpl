{{/*
Expand the name of the chart
*/}}
{{- define "teamcity.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create chart name and version as used by the chart label
*/}}
{{- define "teamcity.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
TeamCity Server - Create a default fully qualified app name for server component
*/}}
{{- define "teamcity.server.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- printf "%s-server" (.Values.fullnameOverride | trunc 56 | trimSuffix "-") }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- printf "%s-server" (.Release.Name | trunc 56 | trimSuffix "-") }}
{{- else }}
{{- printf "%s-%s-server" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
TeamCity Server - Common labels
*/}}
{{- define "teamcity.server.labels" -}}
helm.sh/chart: {{ include "teamcity.chart" . }}
{{ include "teamcity.server.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
TeamCity Server - Selector labels
*/}}
{{- define "teamcity.server.selectorLabels" -}}
app.kubernetes.io/name: {{ include "teamcity.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/component: server
{{- end }}

{{/*
TeamCity Agent - Create a default fully qualified app name for agent component.
*/}}
{{- define "teamcity.agent.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- printf "%s-agent" (.Values.fullnameOverride | trunc 57 | trimSuffix "-") }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- printf "%s-agent" (.Release.Name | trunc 57 | trimSuffix "-") }}
{{- else }}
{{- printf "%s-%s-agent" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
TeamCity Agent - Common labels
*/}}
{{- define "teamcity.agent.labels" -}}
helm.sh/chart: {{ include "teamcity.chart" . }}
{{ include "teamcity.agent.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
TeamCity Agent - Selector labels
*/}}
{{- define "teamcity.agent.selectorLabels" -}}
app.kubernetes.io/name: {{ include "teamcity.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/component: agent
{{- end }}
