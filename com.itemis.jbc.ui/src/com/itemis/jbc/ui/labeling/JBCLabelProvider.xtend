/*
 * generated by Xtext 2.11.0
 */
package com.itemis.jbc.ui.labeling

import com.google.inject.Inject
import com.itemis.jbc.jbc.ClassFile
import com.itemis.jbc.jbc.ConstantClass
import com.itemis.jbc.jbc.ConstantDouble
import com.itemis.jbc.jbc.ConstantFieldRef
import com.itemis.jbc.jbc.ConstantFloat
import com.itemis.jbc.jbc.ConstantInteger
import com.itemis.jbc.jbc.ConstantInterfaceMethodRef
import com.itemis.jbc.jbc.ConstantInvoceDynamic
import com.itemis.jbc.jbc.ConstantLong
import com.itemis.jbc.jbc.ConstantMethodHandle
import com.itemis.jbc.jbc.ConstantMethodRef
import com.itemis.jbc.jbc.ConstantMethodType
import com.itemis.jbc.jbc.ConstantNameAndType
import com.itemis.jbc.jbc.ConstantString
import com.itemis.jbc.jbc.ConstantUtf8
import com.itemis.jbc.jbc.FieldInfo
import com.itemis.jbc.jbc.JbcPackage
import com.itemis.jbc.jbc.MethodInfo
import com.itemis.jbc.jbc.U1
import com.itemis.jbc.jbc.U2
import com.itemis.jbc.jbc.U4
import com.itemis.jbc.jbc.UString
import org.eclipse.emf.ecore.EObject
import org.eclipse.emf.ecore.EReference
import org.eclipse.emf.edit.ui.provider.AdapterFactoryLabelProvider
import org.eclipse.jface.resource.JFaceResources
import org.eclipse.jface.viewers.DelegatingStyledCellLabelProvider.IStyledLabelProvider
import org.eclipse.jface.viewers.StyledString
import org.eclipse.jface.viewers.StyledString.Styler
import org.eclipse.swt.SWT
import org.eclipse.swt.graphics.TextStyle
import org.eclipse.swt.widgets.Display
import org.eclipse.xtext.ui.editor.syntaxcoloring.IHighlightingConfiguration
import org.eclipse.xtext.ui.label.AbstractLabelProvider

import static extension com.itemis.jbc.binary.ClassFileAccessAPI.*
import org.eclipse.jface.viewers.StyledString.Styler

/**
 * Provides labels for EObjects.
 * 
 * See https://www.eclipse.org/Xtext/documentation/304_ide_concepts.html#label-provider
 */
class JBCLabelProvider extends AbstractLabelProvider implements IStyledLabelProvider {

	@Inject IHighlightingConfiguration highlighting

	private static final Styler KEYWORD_STYLER = new Styler() {
		override applyStyles(TextStyle textStyle) {
			textStyle.foreground = Display.getDefault().getSystemColor(SWT.COLOR_DARK_MAGENTA)
			textStyle.font = JFaceResources.getFontRegistry().getBold(JFaceResources.DEFAULT_FONT)
		}
	};

	private static final Styler KEYWORD_THIN_STYLER = new Styler() {
		override applyStyles(TextStyle textStyle) {
			textStyle.foreground = Display.getDefault().getSystemColor(SWT.COLOR_DARK_MAGENTA)
		}
	};

	private static final Styler VALUE_STYLER = new Styler() {
		override applyStyles(TextStyle textStyle) {
			textStyle.foreground = Display.getDefault().getSystemColor(SWT.COLOR_BLUE)
		}
	};

	private static final Styler STRING_STYLER = new Styler() {
		override applyStyles(TextStyle textStyle) {
			textStyle.foreground = Display.getDefault().getSystemColor(SWT.COLOR_DARK_BLUE)
		}
	};

	private static final Styler GREY_STYLER = new Styler() {
		override applyStyles(TextStyle textStyle) {
			textStyle.foreground = Display.getDefault().getSystemColor(SWT.COLOR_GRAY)
		}
	};

	private static final Styler GREY_DARK_STYLER = new Styler() {
		override applyStyles(TextStyle textStyle) {
			textStyle.foreground = Display.getDefault().getSystemColor(SWT.COLOR_DARK_GRAY)
		}
	};

	@Inject
	new(AdapterFactoryLabelProvider delegate) {
		super(delegate);
	}

	override getStyledText(Object element) {
		if (element === null)
			return new StyledString()
		if (!(element instanceof EObject))
			return new StyledString(element.toString)
		switch (element) {
			ClassFile:
				return styledText(element)
			U1:
				return styledText(element)
			U2:
				return styledText(element)
			U4:
				return styledText(element)
			UString:
				return styledText(element)
			ConstantUtf8:
				return styledText(element)
			ConstantClass:
				return styledText(element)
			ConstantNameAndType:
				return styledText(element)
			ConstantFieldRef:
				return styledText(element)
			ConstantMethodRef:
				return styledText(element)
			ConstantInterfaceMethodRef:
				return styledText(element)
			ConstantInteger:
				return styledText(element)
			ConstantFloat:
				return styledText(element)
			ConstantLong:
				return styledText(element)
			ConstantDouble:
				return styledText(element)
			ConstantString:
				return styledText(element)
			ConstantMethodHandle:
				return styledText(element)
			ConstantMethodType:
				return styledText(element)
			ConstantInvoceDynamic:
				return styledText(element)
			MethodInfo:
				return styledText(element)
			FieldInfo:
				return styledText(element)
		}
		return styledText(element as EObject)
	}

	private def styledText(ClassFile classFile) {
		val result = new StyledString()
		if (classFile.isPublic)
			result.add("public ", KEYWORD_STYLER)
		if (classFile.isFinal)
			result.add("final ", KEYWORD_STYLER)
		if (classFile.isSuper)
			result.add("super ", KEYWORD_STYLER)
		if (classFile.isAbstract)
			result.add("abstract ", KEYWORD_STYLER)
		if (classFile.isSynthetic)
			result.add("synthetic ", KEYWORD_STYLER)
		if (classFile.isClass)
			result.add("class ", KEYWORD_STYLER)
		if (classFile.isInterface)
			result.add("interface ", KEYWORD_STYLER)
		if (classFile.isEnum)
			result.add("enum ", KEYWORD_STYLER)
		if (classFile.isAnnotation)
			result.add("annotation ", KEYWORD_STYLER)
		result.add(classFile?.thisClass?.nameIndex?.content?.value).add(" extends ", KEYWORD_STYLER).add(
			classFile?.superClass?.nameIndex?.content?.value)
		if (classFile?.interfaces?.interfaceInfo?.size > 0) {
			result.add(" implements ", KEYWORD_STYLER)
			var seperator = ""
			for (i : classFile?.interfaces.interfaceInfo) {
				result.add(seperator + i?.info?.nameIndex?.content.value)
				seperator = ", "
			}
		}
		result.add(" (" + classFile?.majorVersion?.intValue + "." + classFile.minorVersion?.intValue + ")",
			GREY_DARK_STYLER)
		return result
	}

	override getText(Object element) {
		return getStyledText(element).toString
	}

	private def styledText(U1 u1) {
		new StyledString(u1.value, VALUE_STYLER)
	}

	private def styledText(U2 u2) {
		new StyledString(u2.value, VALUE_STYLER)
	}

	private def styledText(U4 u4) {
		new StyledString(u4.value, VALUE_STYLER)
	}

	private def styledText(UString uString) {
		new StyledString(uString.value, VALUE_STYLER)
	}

	private def styledText(ConstantClass constant) {
		new StyledString("class ", KEYWORD_THIN_STYLER).add(constant?.nameIndex?.content?.value)
	}

	private def styledText(ConstantNameAndType constant) {
		new StyledString("nameAndType ", KEYWORD_THIN_STYLER).add(constant?.descriptorIndex?.content?.value).add("#").
			add(constant?.nameIndex?.content?.value)
	}

	private def styledText(ConstantUtf8 constant) {
		new StyledString("utf8 ", KEYWORD_THIN_STYLER).add(constant.content.value, STRING_STYLER)
	}

	private def styledText(ConstantFieldRef constant) {
		new StyledString("fieldRef ", KEYWORD_THIN_STYLER).add(constant?.classIndex?.nameIndex?.content?.value,
			GREY_DARK_STYLER).add("#", GREY_DARK_STYLER).add(constant?.nameAndTypeIndex?.nameIndex?.content?.value).add(
			" ").add(constant?.nameAndTypeIndex?.descriptorIndex?.content?.value, GREY_STYLER)
	}

	private def styledText(ConstantMethodRef constant) {
		new StyledString("methodRef ", KEYWORD_THIN_STYLER).add(constant?.classIndex?.nameIndex?.content?.value,
			GREY_DARK_STYLER).add("#", GREY_DARK_STYLER).add(constant?.nameAndTypeIndex?.nameIndex?.content?.value).add(
			" ").add(constant?.nameAndTypeIndex?.descriptorIndex?.content?.value, GREY_STYLER)
	}

	private def styledText(ConstantInterfaceMethodRef constant) {
		new StyledString("interfaceMethodRef ", KEYWORD_THIN_STYLER).add(
			constant?.classIndex?.nameIndex?.content?.value, GREY_DARK_STYLER).add("#", GREY_DARK_STYLER).add(
			constant?.nameAndTypeIndex?.nameIndex?.content?.value).add(" ").add(
			constant?.nameAndTypeIndex?.descriptorIndex?.content?.value, GREY_STYLER)
	}

	private def styledText(ConstantInteger constantInteger) {
		new StyledString("int ", KEYWORD_THIN_STYLER).add(Integer.toString(constantInteger.intValue), VALUE_STYLER)
	}

	private def styledText(ConstantFloat constantFloat) {
		new StyledString("float ", KEYWORD_THIN_STYLER).add(Float.toString(constantFloat.floatValue), VALUE_STYLER)
	}

	private def styledText(ConstantLong constantFloat) {
		new StyledString("long ", KEYWORD_THIN_STYLER).add(Long.toString(constantFloat.longValue), VALUE_STYLER)
	}

	private def styledText(ConstantDouble constantDouble) {
		new StyledString("double ", KEYWORD_THIN_STYLER).add(Double.toString(constantDouble.doubleValue), VALUE_STYLER)
	}

	private def styledText(ConstantString constantString) {
		new StyledString("string ", KEYWORD_THIN_STYLER).add('"' + constantString?.stringIndex?.content?.value + '"',
			VALUE_STYLER)
	}

	private def styledText(ConstantMethodHandle constant) {
		new StyledString("methodHandle ", KEYWORD_THIN_STYLER).add(Integer.toString(constant.referenceKind.intValue)).
			add(" ").add(constant.referenceIndex.styledText)
	}

	private def styledText(ConstantMethodType constant) {
		new StyledString("methodType ", KEYWORD_THIN_STYLER).add(constant.descriptorIndex.content.value)
	}

	private def styledText(ConstantInvoceDynamic constant) {
		new StyledString("methodInvokeDynamic ", KEYWORD_THIN_STYLER).add(
			Integer.toString(constant.bootstrapMethodAttrIndex.intValue)).add(" ").add(
			constant?.nameAndTypeIndex?.nameIndex?.content?.value).add(" ").add(
			constant?.nameAndTypeIndex?.descriptorIndex?.content?.value, GREY_STYLER)
	}

	private def styledText(FieldInfo field) {
		val result = new StyledString()
		if (field.isFinal)
			result.add("final ", KEYWORD_THIN_STYLER)
		if (field.isStatic)
			result.add("static ", KEYWORD_THIN_STYLER)
		if (field.isPublic)
			result.add("public ", KEYWORD_THIN_STYLER)
		if (field.isPrivate)
			result.add("private ", KEYWORD_THIN_STYLER)
		if (field.isProtected)
			result.add("protected ", KEYWORD_THIN_STYLER)
		if (field.isPackageProtected)
			result.add("package ", KEYWORD_THIN_STYLER)
		if (field.isVolatile)
			result.add("volatile ", KEYWORD_THIN_STYLER)
		if (field.isTransient)
			result.add("transient ", KEYWORD_THIN_STYLER)
		if (field.isSynthetic)
			result.add("synthetic ", KEYWORD_THIN_STYLER)
		if (field.isEnum)
			result.add("enum ", KEYWORD_THIN_STYLER)
		result.add(field?.nameIndex?.content.value).add(" ").add(field?.descriptorIndex?.content?.value, GREY_STYLER)
		return result
	}

	private def styledText(MethodInfo method) {
		val result = new StyledString()
		if (method.isFinal)
			result.add("final ", KEYWORD_THIN_STYLER)
		if (method.isAbstract)
			result.add("abstract ", KEYWORD_THIN_STYLER)
		if (method.isNative)
			result.add("native ", KEYWORD_THIN_STYLER)
		if (method.isStatic)
			result.add("static ", KEYWORD_THIN_STYLER)
		if (method.isPublic)
			result.add("public ", KEYWORD_THIN_STYLER)
		if (method.isPrivate)
			result.add("private ", KEYWORD_THIN_STYLER)
		if (method.isProtected)
			result.add("protected ", KEYWORD_THIN_STYLER)
		if (method.isPackageProtected)
			result.add("package ", KEYWORD_THIN_STYLER)
		if (method.isSynchronized)
			result.add("synchronized ", KEYWORD_THIN_STYLER)
		if (method.isBridge)
			result.add("bridge ", KEYWORD_THIN_STYLER)
		if (method.isVarargs)
			result.add("varargs ", KEYWORD_THIN_STYLER)
		if (method.isStrict)
			result.add("strict ", KEYWORD_THIN_STYLER)
		if (method.isSynthetic)
			result.add("synthetic ", KEYWORD_THIN_STYLER)
		result.add(method?.nameIndex?.content.value).add(" ").add(method?.descriptorIndex?.content?.value, GREY_STYLER)
		return result
	}

	private def StyledString styledText(EObject eObject) {
		val result = new StyledString(eObject.eClass.name, KEYWORD_THIN_STYLER)
		var seperator = " ";
		for (feature : eObject.eClass.EAllStructuralFeatures) {
			// filter for better readability without implement rule for each element
			if (feature !== JbcPackage.eINSTANCE.codeTableEntry_Tag &&
				feature !== JbcPackage.eINSTANCE.attributeInfo_AttributeNameIndex &&
				feature !== JbcPackage.eINSTANCE.attributeInfo_AttributeLength) {
					if (feature instanceof EReference) {
						if (feature.isContainment) {
							val child = eObject.eGet(feature)
							if (child instanceof U1) {
								result.add(seperator + child.value, GREY_DARK_STYLER)
								seperator = ", "
							} else if (child instanceof U2) {
								result.add(seperator + child.value, GREY_DARK_STYLER)
								seperator = ", "
							} else if (child instanceof U4) {
								result.add(seperator + child.value, GREY_DARK_STYLER)
								seperator = ", "
							}
						} else {
							val reference = eObject.eGet(feature)
							result.add(seperator).add(reference.styledText)
							seperator = ", "
						}
					}
				}
			}
			return result
		}

		// null safe helper
		private def StyledString add(StyledString input, String string) {
			if (string === null)
				return input
			return input.append(string)
		}

		// null safe helper
		private def StyledString add(StyledString input, String string, Styler styler) {
			if (string === null)
				return input
			return input.append(string, styler)
		}

		// null safe helper
		private def StyledString add(StyledString input, StyledString next) {
			if (next === null)
				return input
			return input.append(next)
		}

	}
	