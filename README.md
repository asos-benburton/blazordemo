# blazordemo

Build command
```
cd ./BlazorDemo; curl -sSL https://dot.net/v1/dotnet-install.sh > dotnet-install.sh; chmod +x dotnet-install.sh; ./dotnet-install.sh -InstallDir ./dotnet; ./dotnet/dotnet --version; ./dotnet/dotnet publish -c Release -o output;
```
Build output directory 
```
BlazorDemo/output/wwwroot
```
Cors policy
```
builder.Services.AddCors(options =>
{
    options.AddPolicy(name: "corsPolicy",
        configurePolicy =>
        {
            configurePolicy
                .AllowAnyOrigin()
                .AllowAnyMethod()
                .WithHeaders(HeaderNames.ContentType);
        });
});
```
```
app.UseAuthorization();
app.UseCors("corsPolicy");
```
