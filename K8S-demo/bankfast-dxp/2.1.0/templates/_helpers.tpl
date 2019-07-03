{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "bankfast-dxp-full-stack.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "bankfast-dxp-full-stack.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}


{{- define "host.external" -}}
{{- if eq .Values.host.localname "none" -}}
{{- printf "ib-%s" .Release.Namespace | trimSuffix "-default" -}}
{{- printf "-%s-%s.%s" .Values.deploy.env .Values.deploy.client .Values.host.domainName -}}
{{- else -}}
{{- printf "%s" .Values.host.localname -}}
{{- end -}}
{{- end -}}

{{- define "host.internal" -}}
{{- if eq .Values.host.localname "none" -}}
{{- printf "admin-%s" .Release.Namespace | trimSuffix "-default" -}}
{{- printf "-int-%s-%s.%s" .Values.deploy.env .Values.deploy.client .Values.host.domainName -}}
{{- else -}}
{{- printf "%s" .Values.host.localname -}}
{{- end -}}
{{- end -}}

{{- define "host.sstInternal" -}}
{{- if eq .Values.host.localname "none" -}}
{{- printf "admin-%s" .Release.Namespace | trimSuffix "-default" -}}
{{- printf "-%s-%s-mgmt-core.%s" .Values.deploy.env .Values.deploy.client .Values.host.domainName -}}
{{- else -}}
{{- printf "%s" .Values.host.localname -}}
{{- end -}}
{{- end -}}

{{- define "host.internalAPI" -}}
{{- if eq .Values.host.localname "none" -}}
{{- printf "api-%s" .Release.Namespace | trimSuffix "-default" -}}
{{- printf "-int-%s-%s.%s" .Values.deploy.env .Values.deploy.client .Values.host.domainName -}}
{{- else -}}
{{- printf "%s" .Values.host.localname -}}
{{- end -}}
{{- end -}}

{{- define "host.mars" -}}
{{- if eq .Values.host.localname "none" -}}
{{- printf "mars-%s" .Release.Namespace | trimSuffix "-default" -}}
{{- printf "-%s-%s.%s" .Values.deploy.env .Values.deploy.client .Values.host.domainName -}}
{{- else -}}
{{- printf "%s" .Values.host.localname -}}
{{- end -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "bankfast-dxp-full-stack.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}
