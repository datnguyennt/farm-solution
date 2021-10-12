#See https://aka.ms/containerfastmode to understand how Visual Studio uses this Dockerfile to build your images for faster debugging.

FROM mcr.microsoft.com/dotnet/aspnet:5.0 AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

FROM mcr.microsoft.com/dotnet/sdk:5.0 AS build
WORKDIR /src
COPY ["FarmAPI/FarmAPI.csproj", "FarmAPI/"]
RUN dotnet restore "FarmAPI/FarmAPI.csproj"
COPY . .
WORKDIR "/src/FarmAPI"
RUN dotnet build "FarmAPI.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "FarmAPI.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "FarmAPI.dll"]