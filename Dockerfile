FROM mcr.microsoft.com/dotnet/aspnet:6.0-alpine AS base
WORKDIR /app

FROM mcr.microsoft.com/dotnet/sdk:6.0-alpine AS build
WORKDIR /src
COPY ["./src/DemoApi/DemoApi.csproj", "src/"]
RUN dotnet restore "src/DemoApi.csproj"
COPY . .
WORKDIR "/src/"
RUN dotnet build "DemoApi/DemoApi.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "DemoApi/DemoApi.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .

CMD ASPNETCORE_URLS=http://*:$PORT dotnet DemoApi.dll