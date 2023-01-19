import static com.kms.katalon.core.checkpoint.CheckpointFactory.findCheckpoint
import static com.kms.katalon.core.testcase.TestCaseFactory.findTestCase
import static com.kms.katalon.core.testdata.TestDataFactory.findTestData
import static com.kms.katalon.core.testobject.ObjectRepository.findTestObject

import com.kms.katalon.core.annotation.Keyword
import com.kms.katalon.core.checkpoint.Checkpoint
import com.kms.katalon.core.checkpoint.CheckpointFactory
import com.kms.katalon.core.mobile.keyword.MobileBuiltInKeywords as Mobile
import com.kms.katalon.core.model.FailureHandling
import com.kms.katalon.core.testcase.TestCase
import com.kms.katalon.core.testcase.TestCaseFactory
import com.kms.katalon.core.testdata.TestData
import com.kms.katalon.core.testdata.TestDataFactory
import com.kms.katalon.core.testobject.ObjectRepository
import com.kms.katalon.core.testobject.TestObject
import com.kms.katalon.core.webservice.keyword.WSBuiltInKeywords as WS
import com.kms.katalon.core.webui.keyword.WebUiBuiltInKeywords as WebUI

import internal.GlobalVariable

import org.openqa.selenium.WebElement
import org.openqa.selenium.WebDriver
import org.openqa.selenium.By

import com.kms.katalon.core.mobile.keyword.internal.MobileDriverFactory
import com.kms.katalon.core.webui.driver.DriverFactory

import com.kms.katalon.core.testobject.RequestObject
import com.kms.katalon.core.testobject.ResponseObject
import com.kms.katalon.core.testobject.ConditionType
import com.kms.katalon.core.testobject.TestObjectProperty

import com.kms.katalon.core.mobile.helper.MobileElementCommonHelper
import com.kms.katalon.core.util.KeywordUtil

import com.kms.katalon.core.webui.exception.WebElementNotFoundException

import cucumber.api.java.en.And
import cucumber.api.java.en.Given
import cucumber.api.java.en.Then
import cucumber.api.java.en.When



class Pasos {

	@Given("Que estoy en un navegador")
	def que_estoy_en_un_navegador() {
		WebUI.openBrowser('')
	}

	@Given("accedo a la página de login")
	def accedo_a_la_pagina_de_login() {
		WebUI.navigateToUrl('https://katalon-demo-cura.herokuapp.com/profile.php#login')
	}
	
	@When("Pulso el botón de login")
	def pulso_el_boton_de_login() {
		WebUI.click(findTestObject('Object Repository/Objetos Web Citas/Pagina login Web citas/Boton login Web Citas'))
	}
	
	@When("Escribo en el campo (.*) el valor (.*)")
	def escribo_valor_en_campo(String campo, String valor) {
		WebUI.setText(findTestObject('Object Repository/Objetos Web Citas/Pagina login Web citas/Input '+campo+' Web citas'), valor)
	}
	
	@Then("Se muestra el mensaje Login failed")
	def se_muestra_el_mensaje_Login_failed() {
		WebUI.verifyElementPresent(findTestObject('Object Repository/Objetos Web Citas/Pagina login Web citas/Mensaje login fallido Web Citas'), 0)
	}
	@Then("Llego a la pantalla de citas")
	def llego_a_la_pantalla_de_citas() {
		String url = WebUI.getUrl()
		WebUI.verifyEqual(url, 'https://katalon-demo-cura.herokuapp.com/#appointment')
	}
	@Then("Cierro el navegador")
	def cierro_el_navegador() {
		WebUI.closeBrowser()
	}
}