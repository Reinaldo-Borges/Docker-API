#See https://aka.ms/containerfastmode to understand how Visual Studio uses this Dockerfile to build your images for faster debugging.

FROM mcr.microsoft.com/dotnet/aspnet:8.0-preview AS base
USER app
WORKDIR /app
EXPOSE 8080
EXPOSE 8081

FROM mcr.microsoft.com/dotnet/sdk:8.0-preview AS build
WORKDIR /src
COPY ["Integration.API/Integration.API.csproj", "Integration.API/"]
COPY ["Integration.Infra.Data/Integration.Infra.Data.csproj", "Integration.Infra.Data/"]
COPY ["Integration.Domain/Integration.Domain.csproj", "Integration.Domain/"]
RUN dotnet restore "Integration.API/Integration.API.csproj"
COPY . .
WORKDIR "/src/Integration.API"
RUN dotnet build "Integration.API.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "Integration.API.csproj" -c Release -o /app/publish /p:UseAppHost=false

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "Integration.API.dll"]
