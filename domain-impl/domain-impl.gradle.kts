plugins {
    id("com.android.library")
    id("kotlin-android")
}

apply {
    from("${rootProject.projectDir}/android.gradle")
    from("${rootProject.projectDir}/lint.gradle")
}

dependencies {
    implementation(project(":domain"))
    implementation(project(":domain-entity"))
    implementation(project(":repo"))

    implementation(Dependencies.kotlinStdLib)
    implementation(Dependencies.coroutinesCore)

    implementation(Dependencies.loggingTimber)

    testImplementation(Dependencies.testJunit)
    testImplementation(Dependencies.testKotlinTest)
    testImplementation(Dependencies.testMockito)
    testImplementation(Dependencies.testFlowTest)
    testImplementation(Dependencies.testCoroutines)
}