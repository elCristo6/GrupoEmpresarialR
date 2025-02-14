# Añade tus reglas de ProGuard aquí

# Mantener los nombres de clases y métodos de las actividades de Android
-keepclassmembers class * extends android.app.Activity {
    public void *(android.view.View);
}

# Mantener los nombres de clases y métodos de los controladores de vistas
-keepclassmembers class * extends android.view.View {
    public void *(android.view.View);
}
