{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "eric-data-document-database-pg.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "eric-data-document-database-pg.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- template "eric-data-document-database-pg.name" . -}}
{{- end -}}
{{- end -}}

{{/*
Return the appropriate apiVersion for networkpolicy.
*/}}
{{- define "eric-data-document-database-pg.networkPolicy.apiVersion" -}}
{{- if and (ge .Capabilities.KubeVersion.Minor "4") (le .Capabilities.KubeVersion.Minor "6") -}}
"extensions/v1beta1"
{{- else if ge .Capabilities.KubeVersion.Minor "7" -}}
"networking.k8s.io/v1"
{{- end -}}
{{- end -}}


{{/*
Return the mountpath using in the container's volume.
*/}}
{{- define "eric-data-document-database-pg.mountPath" -}}
{{- if .Values.persistence.mountPath -}}
{{- trimSuffix "/" .Values.persistence.mountPath -}}
{{- else -}}
{{- "/var/lib/postgresql/data" -}}
{{- end -}}
{{- end -}}


{{/* 
Create chart name and version as used by the chart label. 
*/}} 
{{- define "eric-data-document-database-pg.chart" -}} 
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}} 
{{- end -}} 

