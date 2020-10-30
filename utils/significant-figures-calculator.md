---
layout: page
title: Significant figures calculator
parent: Tools
---

<script src="https://cdn.jsdelivr.net/npm/vue"></script>

# Significant figures calculator

<div id="calculator">
	<label>Number</label>
	<input type="number" placeholder="0" v-model="number" v-on:keyup="updateResult" v-on:change="updateResult" />
	<label>Significant figures</label>
	<input type="number" v-model="sigFigures" v-on:keyup="updateResult" v-on:change="updateResult" />
	<label>Result</label>
	<input id="resultField" type="number" v-model="result" readonly="readonly" v-on:click="onClick" /> <button v-on:click="copyToClipboard">Copy to clipboard</button>
</div>

Rules
=====

- All non-zero digits are significant: 1, 2, 3, 4, 5, 6, 7, 8, 9.
- Zeros between non-zero digits are significant: 102, 2005, 50009.
- Leading zeros are never significant: 0.02, 001.887, 0.000515.
- In a number with a decimal point, trailing zeros (those to the right of the last non-zero digit) are significant: 2.02000, 5.400, 57.5400.
- In a number without a decimal point, trailing zeros may or may not be significant. More information through additional graphical symbols or explicit information on errors is needed to clarify the significance of trailing zeros.

External links
==============

* [OpenLearn - Rounding and significant figures](http://www.open.edu/openlearn/science-maths-technology/mathematics-and-statistics/mathematics-education/rounding-and-estimation/content-section-1.5)


<style>
label {
	font-weight: bold;
	display: block;
}
input {
	font-size: x-large;
}
</style>

<script>
var vueCalculator = new Vue({
	el: '#calculator',
	data: {
		number: 0.0,
		sigFigures: 2,
		result: 0
	},
	methods: {
		updateResult: function() {
			//this.result = parseFloat(parseFloat(this.number).toPrecision(this.sigFigures));
			this.result = this.toSignificantFigures(parseFloat(this.number), this.sigFigures);
		},
		toSignificantFigures: function(n, sig) {
			var mult = Math.pow(10, sig - Math.floor(Math.log(n) / Math.LN10) - 1);
			return Math.round(n * mult) / mult;
		},
		onClick: function() {
			document.getElementById('resultField').select();
		},
		copyToClipboard: function() {
			document.getElementById('resultField').select();
			document.execCommand('copy');
		}
	}
});
</script>

