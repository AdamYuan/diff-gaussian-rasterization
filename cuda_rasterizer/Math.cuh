#pragma once
#include "/home/adamyuan/.cache/packman/chk/slang/2025.4/include/slang-cuda-prelude.h"

namespace math {
struct SplatViewGeom_0 {
	float3 conic_0;
	float2 mean2D_0;
	float opacity_0;
};
struct SplatView_0 {
	SplatViewGeom_0 geom_0;
	float3 color_0;
};
struct SplatQuad_0 {
	float2 axis1_0;
	float2 axis2_0;
};
struct SplatGeom_0 {
	float4 quat_0;
	float3 scale_0;
	float3 mean_0;
	float opacity_1;
};
struct SH_0 {
	FixedArray<float3, 16> data_0;
};
struct Splat_0 {
	SplatGeom_0 geom_1;
	SH_0 sh_0;
};
struct Camera_0 {
	float3 pos_0;
	float2 focal_0;
	Matrix<float, 3, 3> viewMat_0;
	uint2 resolution_0;
};
__device__ inline SplatGeom_0 SplatGeom_x24_syn_dzero_0() {
	SplatGeom_0 result_0;
	(&result_0)->quat_0 = make_float4(0.0f);
	float3 _S4 = make_float3(0.0f);
	(&result_0)->scale_0 = _S4;
	(&result_0)->mean_0 = _S4;
	(&result_0)->opacity_1 = 0.0f;
	return result_0;
}
__device__ inline SH_0 SH_x24_syn_dzero_0() {
	SH_0 result_1;
	float3 _S5 = make_float3(0.0f);
	(&result_1)->data_0[int(0)] = _S5;
	(&result_1)->data_0[int(1)] = _S5;
	(&result_1)->data_0[int(2)] = _S5;
	(&result_1)->data_0[int(3)] = _S5;
	(&result_1)->data_0[int(4)] = _S5;
	(&result_1)->data_0[int(5)] = _S5;
	(&result_1)->data_0[int(6)] = _S5;
	(&result_1)->data_0[int(7)] = _S5;
	(&result_1)->data_0[int(8)] = _S5;
	(&result_1)->data_0[int(9)] = _S5;
	(&result_1)->data_0[int(10)] = _S5;
	(&result_1)->data_0[int(11)] = _S5;
	(&result_1)->data_0[int(12)] = _S5;
	(&result_1)->data_0[int(13)] = _S5;
	(&result_1)->data_0[int(14)] = _S5;
	(&result_1)->data_0[int(15)] = _S5;
	return result_1;
}
__device__ inline Splat_0 Splat_x24_syn_dzero_0() {
	Splat_0 result_2;
	(&result_2)->geom_1 = SplatGeom_x24_syn_dzero_0();
	(&result_2)->sh_0 = SH_x24_syn_dzero_0();
	return result_2;
}
struct DiffPair_matrixx3Cfloatx2C3x2C3x3E_0 {
	Matrix<float, 3, 3> primal_0;
	Matrix<float, 3, 3> differential_0;
};
struct DiffPair_vectorx3Cfloatx2C3x3E_0 {
	float3 primal_0;
	float3 differential_0;
};
__device__ void _d_mul_0(DiffPair_matrixx3Cfloatx2C3x2C3x3E_0 *left_0, DiffPair_vectorx3Cfloatx2C3x3E_0 *right_0,
                         float3 dOut_0) {
	float3 right_d_result_0;
	float _S6 = (*left_0).primal_0.rows[int(0)].x * dOut_0.x;
	Matrix<float, 3, 3> left_d_result_0;
	*&(((&left_d_result_0)->rows + (int(0)))->x) = (*right_0).primal_0.x * dOut_0.x;
	float sum_0 = _S6 + (*left_0).primal_0.rows[int(1)].x * dOut_0.y;
	*&(((&left_d_result_0)->rows + (int(1)))->x) = (*right_0).primal_0.x * dOut_0.y;
	float sum_1 = sum_0 + (*left_0).primal_0.rows[int(2)].x * dOut_0.z;
	*&(((&left_d_result_0)->rows + (int(2)))->x) = (*right_0).primal_0.x * dOut_0.z;
	*&((&right_d_result_0)->x) = sum_1;
	float _S7 = (*left_0).primal_0.rows[int(0)].y * dOut_0.x;
	*&(((&left_d_result_0)->rows + (int(0)))->y) = (*right_0).primal_0.y * dOut_0.x;
	float sum_2 = _S7 + (*left_0).primal_0.rows[int(1)].y * dOut_0.y;
	*&(((&left_d_result_0)->rows + (int(1)))->y) = (*right_0).primal_0.y * dOut_0.y;
	float sum_3 = sum_2 + (*left_0).primal_0.rows[int(2)].y * dOut_0.z;
	*&(((&left_d_result_0)->rows + (int(2)))->y) = (*right_0).primal_0.y * dOut_0.z;
	*&((&right_d_result_0)->y) = sum_3;
	float _S8 = (*left_0).primal_0.rows[int(0)].z * dOut_0.x;
	*&(((&left_d_result_0)->rows + (int(0)))->z) = (*right_0).primal_0.z * dOut_0.x;
	float sum_4 = _S8 + (*left_0).primal_0.rows[int(1)].z * dOut_0.y;
	*&(((&left_d_result_0)->rows + (int(1)))->z) = (*right_0).primal_0.z * dOut_0.y;
	float sum_5 = sum_4 + (*left_0).primal_0.rows[int(2)].z * dOut_0.z;
	*&(((&left_d_result_0)->rows + (int(2)))->z) = (*right_0).primal_0.z * dOut_0.z;
	*&((&right_d_result_0)->z) = sum_5;
	left_0->primal_0 = (*left_0).primal_0;
	left_0->differential_0 = left_d_result_0;
	right_0->primal_0 = (*right_0).primal_0;
	right_0->differential_0 = right_d_result_0;
	return;
}
__device__ float3 mul_0(Matrix<float, 3, 3> left_1, float3 right_1) {
	float3 result_3;
	int i_0 = int(0);
	for (;;) {
		if (i_0 < int(3)) {
		} else {
			break;
		}
		int _S9 = i_0;
		int j_0 = int(0);
		float sum_6 = 0.0f;
		for (;;) {
			if (j_0 < int(3)) {
			} else {
				break;
			}
			float sum_7 =
			    sum_6 + _slang_vector_get_element(left_1.rows[_S9], j_0) * _slang_vector_get_element(right_1, j_0);
			j_0 = j_0 + int(1);
			sum_6 = sum_7;
		}
		*_slang_vector_get_element_ptr(&result_3, i_0) = sum_6;
		i_0 = i_0 + int(1);
	}
	return result_3;
}
__device__ float2 min_0(float2 x_0, float2 y_0) {
	float2 result_4;
	int i_1 = int(0);
	for (;;) {
		if (i_1 < int(2)) {
		} else {
			break;
		}
		*_slang_vector_get_element_ptr(&result_4, i_1) =
		    (F32_min((_slang_vector_get_element(x_0, i_1)), (_slang_vector_get_element(y_0, i_1))));
		i_1 = i_1 + int(1);
	}
	return result_4;
}
struct DiffPair_float_0 {
	float primal_0;
	float differential_0;
};
__device__ void _d_max_0(DiffPair_float_0 *dpx_0, DiffPair_float_0 *dpy_0, float dOut_1) {
	DiffPair_float_0 _S10 = *dpx_0;
	float _S11;
	if (((*dpx_0).primal_0) > ((*dpy_0).primal_0)) {
		_S11 = dOut_1;
	} else {
		_S11 = 0.0f;
	}
	dpx_0->primal_0 = _S10.primal_0;
	dpx_0->differential_0 = _S11;
	DiffPair_float_0 _S12 = *dpy_0;
	if (((*dpy_0).primal_0) > (_S10.primal_0)) {
		_S11 = dOut_1;
	} else {
		_S11 = 0.0f;
	}
	dpy_0->primal_0 = _S12.primal_0;
	dpy_0->differential_0 = _S11;
	return;
}
__device__ void _d_max_vector_0(DiffPair_vectorx3Cfloatx2C3x3E_0 *dpx_1, DiffPair_vectorx3Cfloatx2C3x3E_0 *dpy_1,
                                float3 dOut_2) {
	DiffPair_float_0 left_dp_0;
	(&left_dp_0)->primal_0 = (*dpx_1).primal_0.x;
	(&left_dp_0)->differential_0 = 0.0f;
	DiffPair_float_0 right_dp_0;
	(&right_dp_0)->primal_0 = (*dpy_1).primal_0.x;
	(&right_dp_0)->differential_0 = 0.0f;
	_d_max_0(&left_dp_0, &right_dp_0, dOut_2.x);
	float3 left_d_result_1;
	*&((&left_d_result_1)->x) = left_dp_0.differential_0;
	float3 right_d_result_1;
	*&((&right_d_result_1)->x) = right_dp_0.differential_0;
	DiffPair_float_0 left_dp_1;
	(&left_dp_1)->primal_0 = (*dpx_1).primal_0.y;
	(&left_dp_1)->differential_0 = 0.0f;
	DiffPair_float_0 right_dp_1;
	(&right_dp_1)->primal_0 = (*dpy_1).primal_0.y;
	(&right_dp_1)->differential_0 = 0.0f;
	_d_max_0(&left_dp_1, &right_dp_1, dOut_2.y);
	*&((&left_d_result_1)->y) = left_dp_1.differential_0;
	*&((&right_d_result_1)->y) = right_dp_1.differential_0;
	DiffPair_float_0 left_dp_2;
	(&left_dp_2)->primal_0 = (*dpx_1).primal_0.z;
	(&left_dp_2)->differential_0 = 0.0f;
	DiffPair_float_0 right_dp_2;
	(&right_dp_2)->primal_0 = (*dpy_1).primal_0.z;
	(&right_dp_2)->differential_0 = 0.0f;
	_d_max_0(&left_dp_2, &right_dp_2, dOut_2.z);
	*&((&left_d_result_1)->z) = left_dp_2.differential_0;
	*&((&right_d_result_1)->z) = right_dp_2.differential_0;
	dpx_1->primal_0 = (*dpx_1).primal_0;
	dpx_1->differential_0 = left_d_result_1;
	dpy_1->primal_0 = (*dpy_1).primal_0;
	dpy_1->differential_0 = right_d_result_1;
	return;
}
__device__ float2 max_0(float2 x_1, float2 y_1) {
	float2 result_5;
	int i_2 = int(0);
	for (;;) {
		if (i_2 < int(2)) {
		} else {
			break;
		}
		*_slang_vector_get_element_ptr(&result_5, i_2) =
		    (F32_max((_slang_vector_get_element(x_1, i_2)), (_slang_vector_get_element(y_1, i_2))));
		i_2 = i_2 + int(1);
	}
	return result_5;
}
__device__ void _d_clamp_0(DiffPair_float_0 *dpx_2, DiffPair_float_0 *dpMin_0, DiffPair_float_0 *dpMax_0,
                           float dOut_3) {
	DiffPair_float_0 _S13 = *dpx_2;
	bool _S14;
	if (((*dpx_2).primal_0) > ((*dpMin_0).primal_0)) {
		_S14 = ((*dpx_2).primal_0) < ((*dpMax_0).primal_0);
	} else {
		_S14 = false;
	}
	float _S15;
	if (_S14) {
		_S15 = dOut_3;
	} else {
		_S15 = 0.0f;
	}
	dpx_2->primal_0 = _S13.primal_0;
	dpx_2->differential_0 = _S15;
	DiffPair_float_0 _S16 = *dpMin_0;
	if ((_S13.primal_0) <= ((*dpMin_0).primal_0)) {
		_S15 = dOut_3;
	} else {
		_S15 = 0.0f;
	}
	dpMin_0->primal_0 = _S16.primal_0;
	dpMin_0->differential_0 = _S15;
	DiffPair_float_0 _S17 = *dpMax_0;
	if (((*dpx_2).primal_0) >= ((*dpMax_0).primal_0)) {
		_S15 = dOut_3;
	} else {
		_S15 = 0.0f;
	}
	dpMax_0->primal_0 = _S17.primal_0;
	dpMax_0->differential_0 = _S15;
	return;
}
struct DiffPair_vectorx3Cfloatx2C2x3E_0 {
	float2 primal_0;
	float2 differential_0;
};
__device__ void _d_clamp_vector_0(DiffPair_vectorx3Cfloatx2C2x3E_0 *dpx_3, DiffPair_vectorx3Cfloatx2C2x3E_0 *dpy_2,
                                  DiffPair_vectorx3Cfloatx2C2x3E_0 *dpz_0, float2 dOut_4) {
	DiffPair_float_0 left_dp_3;
	(&left_dp_3)->primal_0 = (*dpx_3).primal_0.x;
	(&left_dp_3)->differential_0 = 0.0f;
	DiffPair_float_0 middle_dp_0;
	(&middle_dp_0)->primal_0 = (*dpy_2).primal_0.x;
	(&middle_dp_0)->differential_0 = 0.0f;
	DiffPair_float_0 right_dp_3;
	(&right_dp_3)->primal_0 = (*dpz_0).primal_0.x;
	(&right_dp_3)->differential_0 = 0.0f;
	_d_clamp_0(&left_dp_3, &middle_dp_0, &right_dp_3, dOut_4.x);
	float2 left_d_result_2;
	*&((&left_d_result_2)->x) = left_dp_3.differential_0;
	float2 middle_d_result_0;
	*&((&middle_d_result_0)->x) = middle_dp_0.differential_0;
	float2 right_d_result_2;
	*&((&right_d_result_2)->x) = right_dp_3.differential_0;
	DiffPair_float_0 left_dp_4;
	(&left_dp_4)->primal_0 = (*dpx_3).primal_0.y;
	(&left_dp_4)->differential_0 = 0.0f;
	DiffPair_float_0 middle_dp_1;
	(&middle_dp_1)->primal_0 = (*dpy_2).primal_0.y;
	(&middle_dp_1)->differential_0 = 0.0f;
	DiffPair_float_0 right_dp_4;
	(&right_dp_4)->primal_0 = (*dpz_0).primal_0.y;
	(&right_dp_4)->differential_0 = 0.0f;
	_d_clamp_0(&left_dp_4, &middle_dp_1, &right_dp_4, dOut_4.y);
	*&((&left_d_result_2)->y) = left_dp_4.differential_0;
	*&((&middle_d_result_0)->y) = middle_dp_1.differential_0;
	*&((&right_d_result_2)->y) = right_dp_4.differential_0;
	dpx_3->primal_0 = (*dpx_3).primal_0;
	dpx_3->differential_0 = left_d_result_2;
	dpy_2->primal_0 = (*dpy_2).primal_0;
	dpy_2->differential_0 = middle_d_result_0;
	dpz_0->primal_0 = (*dpz_0).primal_0;
	dpz_0->differential_0 = right_d_result_2;
	return;
}
__device__ float2 clamp_0(float2 x_2, float2 minBound_0, float2 maxBound_0) {
	return min_0(max_0(x_2, minBound_0), maxBound_0);
}
__device__ void mul_1(DiffPair_matrixx3Cfloatx2C3x2C3x3E_0 *left_2, DiffPair_matrixx3Cfloatx2C3x2C3x3E_0 *right_2,
                      Matrix<float, 3, 3> dOut_5) {
	Matrix<float, 3, 3> left_d_result_3;
	*&(((&left_d_result_3)->rows + (int(0)))->x) = 0.0f;
	*&(((&left_d_result_3)->rows + (int(0)))->y) = 0.0f;
	*&(((&left_d_result_3)->rows + (int(0)))->z) = 0.0f;
	*&(((&left_d_result_3)->rows + (int(1)))->x) = 0.0f;
	*&(((&left_d_result_3)->rows + (int(1)))->y) = 0.0f;
	*&(((&left_d_result_3)->rows + (int(1)))->z) = 0.0f;
	*&(((&left_d_result_3)->rows + (int(2)))->x) = 0.0f;
	*&(((&left_d_result_3)->rows + (int(2)))->y) = 0.0f;
	*&(((&left_d_result_3)->rows + (int(2)))->z) = 0.0f;
	Matrix<float, 3, 3> right_d_result_3;
	*&(((&right_d_result_3)->rows + (int(0)))->x) = 0.0f;
	*&(((&right_d_result_3)->rows + (int(0)))->y) = 0.0f;
	*&(((&right_d_result_3)->rows + (int(0)))->z) = 0.0f;
	*&(((&right_d_result_3)->rows + (int(1)))->x) = 0.0f;
	*&(((&right_d_result_3)->rows + (int(1)))->y) = 0.0f;
	*&(((&right_d_result_3)->rows + (int(1)))->z) = 0.0f;
	*&(((&right_d_result_3)->rows + (int(2)))->x) = 0.0f;
	*&(((&right_d_result_3)->rows + (int(2)))->y) = 0.0f;
	*&(((&right_d_result_3)->rows + (int(2)))->z) = 0.0f;
	*&(((&left_d_result_3)->rows + (int(0)))->x) =
	    *&(((&left_d_result_3)->rows + (int(0)))->x) + (*right_2).primal_0.rows[int(0)].x * dOut_5.rows[int(0)].x;
	*&(((&right_d_result_3)->rows + (int(0)))->x) =
	    *&(((&right_d_result_3)->rows + (int(0)))->x) + (*left_2).primal_0.rows[int(0)].x * dOut_5.rows[int(0)].x;
	*&(((&left_d_result_3)->rows + (int(0)))->y) =
	    *&(((&left_d_result_3)->rows + (int(0)))->y) + (*right_2).primal_0.rows[int(1)].x * dOut_5.rows[int(0)].x;
	*&(((&right_d_result_3)->rows + (int(1)))->x) =
	    *&(((&right_d_result_3)->rows + (int(1)))->x) + (*left_2).primal_0.rows[int(0)].y * dOut_5.rows[int(0)].x;
	*&(((&left_d_result_3)->rows + (int(0)))->z) =
	    *&(((&left_d_result_3)->rows + (int(0)))->z) + (*right_2).primal_0.rows[int(2)].x * dOut_5.rows[int(0)].x;
	*&(((&right_d_result_3)->rows + (int(2)))->x) =
	    *&(((&right_d_result_3)->rows + (int(2)))->x) + (*left_2).primal_0.rows[int(0)].z * dOut_5.rows[int(0)].x;
	*&(((&left_d_result_3)->rows + (int(0)))->x) =
	    *&(((&left_d_result_3)->rows + (int(0)))->x) + (*right_2).primal_0.rows[int(0)].y * dOut_5.rows[int(0)].y;
	*&(((&right_d_result_3)->rows + (int(0)))->y) =
	    *&(((&right_d_result_3)->rows + (int(0)))->y) + (*left_2).primal_0.rows[int(0)].x * dOut_5.rows[int(0)].y;
	*&(((&left_d_result_3)->rows + (int(0)))->y) =
	    *&(((&left_d_result_3)->rows + (int(0)))->y) + (*right_2).primal_0.rows[int(1)].y * dOut_5.rows[int(0)].y;
	*&(((&right_d_result_3)->rows + (int(1)))->y) =
	    *&(((&right_d_result_3)->rows + (int(1)))->y) + (*left_2).primal_0.rows[int(0)].y * dOut_5.rows[int(0)].y;
	*&(((&left_d_result_3)->rows + (int(0)))->z) =
	    *&(((&left_d_result_3)->rows + (int(0)))->z) + (*right_2).primal_0.rows[int(2)].y * dOut_5.rows[int(0)].y;
	*&(((&right_d_result_3)->rows + (int(2)))->y) =
	    *&(((&right_d_result_3)->rows + (int(2)))->y) + (*left_2).primal_0.rows[int(0)].z * dOut_5.rows[int(0)].y;
	*&(((&left_d_result_3)->rows + (int(0)))->x) =
	    *&(((&left_d_result_3)->rows + (int(0)))->x) + (*right_2).primal_0.rows[int(0)].z * dOut_5.rows[int(0)].z;
	*&(((&right_d_result_3)->rows + (int(0)))->z) =
	    *&(((&right_d_result_3)->rows + (int(0)))->z) + (*left_2).primal_0.rows[int(0)].x * dOut_5.rows[int(0)].z;
	*&(((&left_d_result_3)->rows + (int(0)))->y) =
	    *&(((&left_d_result_3)->rows + (int(0)))->y) + (*right_2).primal_0.rows[int(1)].z * dOut_5.rows[int(0)].z;
	*&(((&right_d_result_3)->rows + (int(1)))->z) =
	    *&(((&right_d_result_3)->rows + (int(1)))->z) + (*left_2).primal_0.rows[int(0)].y * dOut_5.rows[int(0)].z;
	*&(((&left_d_result_3)->rows + (int(0)))->z) =
	    *&(((&left_d_result_3)->rows + (int(0)))->z) + (*right_2).primal_0.rows[int(2)].z * dOut_5.rows[int(0)].z;
	*&(((&right_d_result_3)->rows + (int(2)))->z) =
	    *&(((&right_d_result_3)->rows + (int(2)))->z) + (*left_2).primal_0.rows[int(0)].z * dOut_5.rows[int(0)].z;
	*&(((&left_d_result_3)->rows + (int(1)))->x) =
	    *&(((&left_d_result_3)->rows + (int(1)))->x) + (*right_2).primal_0.rows[int(0)].x * dOut_5.rows[int(1)].x;
	*&(((&right_d_result_3)->rows + (int(0)))->x) =
	    *&(((&right_d_result_3)->rows + (int(0)))->x) + (*left_2).primal_0.rows[int(1)].x * dOut_5.rows[int(1)].x;
	*&(((&left_d_result_3)->rows + (int(1)))->y) =
	    *&(((&left_d_result_3)->rows + (int(1)))->y) + (*right_2).primal_0.rows[int(1)].x * dOut_5.rows[int(1)].x;
	*&(((&right_d_result_3)->rows + (int(1)))->x) =
	    *&(((&right_d_result_3)->rows + (int(1)))->x) + (*left_2).primal_0.rows[int(1)].y * dOut_5.rows[int(1)].x;
	*&(((&left_d_result_3)->rows + (int(1)))->z) =
	    *&(((&left_d_result_3)->rows + (int(1)))->z) + (*right_2).primal_0.rows[int(2)].x * dOut_5.rows[int(1)].x;
	*&(((&right_d_result_3)->rows + (int(2)))->x) =
	    *&(((&right_d_result_3)->rows + (int(2)))->x) + (*left_2).primal_0.rows[int(1)].z * dOut_5.rows[int(1)].x;
	*&(((&left_d_result_3)->rows + (int(1)))->x) =
	    *&(((&left_d_result_3)->rows + (int(1)))->x) + (*right_2).primal_0.rows[int(0)].y * dOut_5.rows[int(1)].y;
	*&(((&right_d_result_3)->rows + (int(0)))->y) =
	    *&(((&right_d_result_3)->rows + (int(0)))->y) + (*left_2).primal_0.rows[int(1)].x * dOut_5.rows[int(1)].y;
	*&(((&left_d_result_3)->rows + (int(1)))->y) =
	    *&(((&left_d_result_3)->rows + (int(1)))->y) + (*right_2).primal_0.rows[int(1)].y * dOut_5.rows[int(1)].y;
	*&(((&right_d_result_3)->rows + (int(1)))->y) =
	    *&(((&right_d_result_3)->rows + (int(1)))->y) + (*left_2).primal_0.rows[int(1)].y * dOut_5.rows[int(1)].y;
	*&(((&left_d_result_3)->rows + (int(1)))->z) =
	    *&(((&left_d_result_3)->rows + (int(1)))->z) + (*right_2).primal_0.rows[int(2)].y * dOut_5.rows[int(1)].y;
	*&(((&right_d_result_3)->rows + (int(2)))->y) =
	    *&(((&right_d_result_3)->rows + (int(2)))->y) + (*left_2).primal_0.rows[int(1)].z * dOut_5.rows[int(1)].y;
	*&(((&left_d_result_3)->rows + (int(1)))->x) =
	    *&(((&left_d_result_3)->rows + (int(1)))->x) + (*right_2).primal_0.rows[int(0)].z * dOut_5.rows[int(1)].z;
	*&(((&right_d_result_3)->rows + (int(0)))->z) =
	    *&(((&right_d_result_3)->rows + (int(0)))->z) + (*left_2).primal_0.rows[int(1)].x * dOut_5.rows[int(1)].z;
	*&(((&left_d_result_3)->rows + (int(1)))->y) =
	    *&(((&left_d_result_3)->rows + (int(1)))->y) + (*right_2).primal_0.rows[int(1)].z * dOut_5.rows[int(1)].z;
	*&(((&right_d_result_3)->rows + (int(1)))->z) =
	    *&(((&right_d_result_3)->rows + (int(1)))->z) + (*left_2).primal_0.rows[int(1)].y * dOut_5.rows[int(1)].z;
	*&(((&left_d_result_3)->rows + (int(1)))->z) =
	    *&(((&left_d_result_3)->rows + (int(1)))->z) + (*right_2).primal_0.rows[int(2)].z * dOut_5.rows[int(1)].z;
	*&(((&right_d_result_3)->rows + (int(2)))->z) =
	    *&(((&right_d_result_3)->rows + (int(2)))->z) + (*left_2).primal_0.rows[int(1)].z * dOut_5.rows[int(1)].z;
	*&(((&left_d_result_3)->rows + (int(2)))->x) =
	    *&(((&left_d_result_3)->rows + (int(2)))->x) + (*right_2).primal_0.rows[int(0)].x * dOut_5.rows[int(2)].x;
	*&(((&right_d_result_3)->rows + (int(0)))->x) =
	    *&(((&right_d_result_3)->rows + (int(0)))->x) + (*left_2).primal_0.rows[int(2)].x * dOut_5.rows[int(2)].x;
	*&(((&left_d_result_3)->rows + (int(2)))->y) =
	    *&(((&left_d_result_3)->rows + (int(2)))->y) + (*right_2).primal_0.rows[int(1)].x * dOut_5.rows[int(2)].x;
	*&(((&right_d_result_3)->rows + (int(1)))->x) =
	    *&(((&right_d_result_3)->rows + (int(1)))->x) + (*left_2).primal_0.rows[int(2)].y * dOut_5.rows[int(2)].x;
	*&(((&left_d_result_3)->rows + (int(2)))->z) =
	    *&(((&left_d_result_3)->rows + (int(2)))->z) + (*right_2).primal_0.rows[int(2)].x * dOut_5.rows[int(2)].x;
	*&(((&right_d_result_3)->rows + (int(2)))->x) =
	    *&(((&right_d_result_3)->rows + (int(2)))->x) + (*left_2).primal_0.rows[int(2)].z * dOut_5.rows[int(2)].x;
	*&(((&left_d_result_3)->rows + (int(2)))->x) =
	    *&(((&left_d_result_3)->rows + (int(2)))->x) + (*right_2).primal_0.rows[int(0)].y * dOut_5.rows[int(2)].y;
	*&(((&right_d_result_3)->rows + (int(0)))->y) =
	    *&(((&right_d_result_3)->rows + (int(0)))->y) + (*left_2).primal_0.rows[int(2)].x * dOut_5.rows[int(2)].y;
	*&(((&left_d_result_3)->rows + (int(2)))->y) =
	    *&(((&left_d_result_3)->rows + (int(2)))->y) + (*right_2).primal_0.rows[int(1)].y * dOut_5.rows[int(2)].y;
	*&(((&right_d_result_3)->rows + (int(1)))->y) =
	    *&(((&right_d_result_3)->rows + (int(1)))->y) + (*left_2).primal_0.rows[int(2)].y * dOut_5.rows[int(2)].y;
	*&(((&left_d_result_3)->rows + (int(2)))->z) =
	    *&(((&left_d_result_3)->rows + (int(2)))->z) + (*right_2).primal_0.rows[int(2)].y * dOut_5.rows[int(2)].y;
	*&(((&right_d_result_3)->rows + (int(2)))->y) =
	    *&(((&right_d_result_3)->rows + (int(2)))->y) + (*left_2).primal_0.rows[int(2)].z * dOut_5.rows[int(2)].y;
	*&(((&left_d_result_3)->rows + (int(2)))->x) =
	    *&(((&left_d_result_3)->rows + (int(2)))->x) + (*right_2).primal_0.rows[int(0)].z * dOut_5.rows[int(2)].z;
	*&(((&right_d_result_3)->rows + (int(0)))->z) =
	    *&(((&right_d_result_3)->rows + (int(0)))->z) + (*left_2).primal_0.rows[int(2)].x * dOut_5.rows[int(2)].z;
	*&(((&left_d_result_3)->rows + (int(2)))->y) =
	    *&(((&left_d_result_3)->rows + (int(2)))->y) + (*right_2).primal_0.rows[int(1)].z * dOut_5.rows[int(2)].z;
	*&(((&right_d_result_3)->rows + (int(1)))->z) =
	    *&(((&right_d_result_3)->rows + (int(1)))->z) + (*left_2).primal_0.rows[int(2)].y * dOut_5.rows[int(2)].z;
	*&(((&left_d_result_3)->rows + (int(2)))->z) =
	    *&(((&left_d_result_3)->rows + (int(2)))->z) + (*right_2).primal_0.rows[int(2)].z * dOut_5.rows[int(2)].z;
	*&(((&right_d_result_3)->rows + (int(2)))->z) =
	    *&(((&right_d_result_3)->rows + (int(2)))->z) + (*left_2).primal_0.rows[int(2)].z * dOut_5.rows[int(2)].z;
	left_2->primal_0 = (*left_2).primal_0;
	left_2->differential_0 = left_d_result_3;
	right_2->primal_0 = (*right_2).primal_0;
	right_2->differential_0 = right_d_result_3;
	return;
}
__device__ Matrix<float, 3, 3> mul_2(Matrix<float, 3, 3> left_3, Matrix<float, 3, 3> right_3) {
	Matrix<float, 3, 3> result_6;
	int r_0 = int(0);
	for (;;) {
		if (r_0 < int(3)) {
		} else {
			break;
		}
		int _S18 = r_0;
		int c_0 = int(0);
		for (;;) {
			if (c_0 < int(3)) {
			} else {
				break;
			}
			int i_3 = int(0);
			float sum_8 = 0.0f;
			for (;;) {
				if (i_3 < int(3)) {
				} else {
					break;
				}
				float sum_9 = sum_8 + _slang_vector_get_element(left_3.rows[_S18], i_3) *
				                          _slang_vector_get_element(right_3.rows[i_3], c_0);
				i_3 = i_3 + int(1);
				sum_8 = sum_9;
			}
			*_slang_vector_get_element_ptr(((&result_6)->rows + (r_0)), c_0) = sum_8;
			c_0 = c_0 + int(1);
		}
		r_0 = r_0 + int(1);
	}
	return result_6;
}
__device__ Matrix<float, 3, 3> transpose_0(Matrix<float, 3, 3> x_3) {
	Matrix<float, 3, 3> result_7;
	int r_1 = int(0);
	for (;;) {
		if (r_1 < int(3)) {
		} else {
			break;
		}
		int c_1 = int(0);
		for (;;) {
			if (c_1 < int(3)) {
			} else {
				break;
			}
			*_slang_vector_get_element_ptr(((&result_7)->rows + (r_1)), c_1) =
			    _slang_vector_get_element(x_3.rows[c_1], r_1);
			c_1 = c_1 + int(1);
		}
		r_1 = r_1 + int(1);
	}
	return result_7;
}
__device__ void _d_sqrt_0(DiffPair_float_0 *dpx_4, float dOut_6) {
	float _S19 = 0.5f / (F32_sqrt(((F32_max((1.00000001168609742e-07f), ((*dpx_4).primal_0)))))) * dOut_6;
	dpx_4->primal_0 = (*dpx_4).primal_0;
	dpx_4->differential_0 = _S19;
	return;
}
__device__ float dot_0(float3 x_4, float3 y_2) {
	int i_4 = int(0);
	float result_8 = 0.0f;
	for (;;) {
		if (i_4 < int(3)) {
		} else {
			break;
		}
		float result_9 = result_8 + _slang_vector_get_element(x_4, i_4) * _slang_vector_get_element(y_2, i_4);
		i_4 = i_4 + int(1);
		result_8 = result_9;
	}
	return result_8;
}
__device__ float length_0(float3 x_5) { return (F32_sqrt((dot_0(x_5, x_5)))); }
__device__ float3 normalize_0(float3 x_6) { return x_6 / make_float3(length_0(x_6)); }
struct DiffPair_Splat_0 {
	Splat_0 primal_0;
	Splat_0 differential_0;
};
__device__ float3 s_primal_ctx_mul_0(Matrix<float, 3, 3> _S20, float3 _S21) { return mul_0(_S20, _S21); }
__device__ float2 s_primal_ctx_clamp_0(float2 _S22, float2 _S23, float2 _S24) { return clamp_0(_S22, _S23, _S24); }
__device__ Matrix<float, 3, 3> s_primal_ctx_scale2matrix_0(float3 dpscale_0) {
	return makeMatrix<float, 3, 3>(dpscale_0.x, 0.0f, 0.0f, 0.0f, dpscale_0.y, 0.0f, 0.0f, 0.0f, dpscale_0.z);
}
__device__ Matrix<float, 3, 3> s_primal_ctx_quat2matrix_0(float4 dpquat_0) {
	float _S25 = dpquat_0.z;
	float _S26 = _S25 * _S25;
	float _S27 = dpquat_0.w * dpquat_0.w;
	float _S28 = dpquat_0.y * dpquat_0.z;
	float _S29 = dpquat_0.x * dpquat_0.w;
	float _S30 = dpquat_0.y * dpquat_0.w;
	float _S31 = dpquat_0.x * dpquat_0.z;
	float _S32 = dpquat_0.y * dpquat_0.y;
	float _S33 = dpquat_0.z * dpquat_0.w;
	float _S34 = dpquat_0.x * dpquat_0.y;
	return makeMatrix<float, 3, 3>(
	    make_float3(1.0f - 2.0f * (_S26 + _S27), 2.0f * (_S28 - _S29), 2.0f * (_S30 + _S31)),
	    make_float3(2.0f * (_S28 + _S29), 1.0f - 2.0f * (_S32 + _S27), 2.0f * (_S33 - _S34)),
	    make_float3(2.0f * (_S30 - _S31), 2.0f * (_S33 + _S34), 1.0f - 2.0f * (_S32 + _S26)));
}
__device__ Matrix<float, 3, 3> s_primal_ctx_mul_1(Matrix<float, 3, 3> _S35, Matrix<float, 3, 3> _S36) {
	return mul_2(_S35, _S36);
}
struct DiffPair_SH_0 {
	SH_0 primal_0;
	SH_0 differential_0;
};
__device__ void s_bwd_prop_max_0(DiffPair_vectorx3Cfloatx2C3x3E_0 *_S37, DiffPair_vectorx3Cfloatx2C3x3E_0 *_S38,
                                 float3 _S39) {
	_d_max_vector_0(_S37, _S38, _S39);
	return;
}
__device__ void s_bwd_prop_sh2color_0(DiffPair_SH_0 *dpsh_0, DiffPair_vectorx3Cfloatx2C3x3E_0 *dpdir_0,
                                      float3 _s_dOut_0) {
	float x_7 = (*dpdir_0).primal_0.x;
	float y_3 = (*dpdir_0).primal_0.y;
	float z_0 = (*dpdir_0).primal_0.z;
	float xx_0 = x_7 * x_7;
	float yy_0 = y_3 * y_3;
	float zz_0 = z_0 * z_0;
	float xy_0 = x_7 * y_3;
	float _S40 = -0.48860251903533936f * y_3;
	float3 _S41 = make_float3(_S40);
	float _S42 = 0.48860251903533936f * z_0;
	float3 _S43 = make_float3(_S42);
	float _S44 = 0.48860251903533936f * x_7;
	float3 _S45 = make_float3(_S44);
	float _S46 = 1.09254848957061768f * xy_0;
	float3 _S47 = make_float3(_S46);
	float _S48 = -1.09254848957061768f * (y_3 * z_0);
	float3 _S49 = make_float3(_S48);
	float _S50 = 2.0f * zz_0;
	float _S51 = 0.31539157032966614f * (_S50 - xx_0 - yy_0);
	float3 _S52 = make_float3(_S51);
	float _S53 = -1.09254848957061768f * (x_7 * z_0);
	float3 _S54 = make_float3(_S53);
	float _S55 = xx_0 - yy_0;
	float _S56 = 0.54627424478530884f * _S55;
	float3 _S57 = make_float3(_S56);
	float _S58 = -0.59004360437393188f * y_3;
	float _S59 = 3.0f * xx_0;
	float _S60 = _S59 - yy_0;
	float _S61 = _S58 * _S60;
	float3 _S62 = make_float3(_S61);
	float _S63 = 2.89061141014099121f * xy_0;
	float _S64 = _S63 * z_0;
	float3 _S65 = make_float3(_S64);
	float _S66 = -0.4570457935333252f * y_3;
	float _S67 = 4.0f * zz_0 - xx_0 - yy_0;
	float _S68 = _S66 * _S67;
	float3 _S69 = make_float3(_S68);
	float _S70 = 0.37317633628845215f * z_0;
	float _S71 = 3.0f * yy_0;
	float _S72 = _S50 - _S59 - _S71;
	float _S73 = _S70 * _S72;
	float3 _S74 = make_float3(_S73);
	float _S75 = -0.4570457935333252f * x_7;
	float _S76 = _S75 * _S67;
	float3 _S77 = make_float3(_S76);
	float _S78 = 1.44530570507049561f * z_0;
	float _S79 = _S78 * _S55;
	float3 _S80 = make_float3(_S79);
	float _S81 = -0.59004360437393188f * x_7;
	float _S82 = xx_0 - _S71;
	float _S83 = _S81 * _S82;
	float3 _S84 = make_float3(_S83);
	float3 _S85 = make_float3(0.0f);
	float3 _S86 = make_float3(0.0f);
	DiffPair_vectorx3Cfloatx2C3x3E_0 _S87;
	(&_S87)->primal_0 =
	    make_float3(0.282094806432724f) * (*dpsh_0).primal_0.data_0[int(0)] + make_float3(0.5f) +
	    (make_float3(_S40) * (*dpsh_0).primal_0.data_0[int(1)] + make_float3(_S42) * (*dpsh_0).primal_0.data_0[int(2)] -
	     make_float3(_S44) * (*dpsh_0).primal_0.data_0[int(3)]) +
	    (make_float3(_S46) * (*dpsh_0).primal_0.data_0[int(4)] + make_float3(_S48) * (*dpsh_0).primal_0.data_0[int(5)] +
	     make_float3(_S51) * (*dpsh_0).primal_0.data_0[int(6)] + make_float3(_S53) * (*dpsh_0).primal_0.data_0[int(7)] +
	     make_float3(_S56) * (*dpsh_0).primal_0.data_0[int(8)]) +
	    (make_float3(_S61) * (*dpsh_0).primal_0.data_0[int(9)] +
	     make_float3(_S64) * (*dpsh_0).primal_0.data_0[int(10)] +
	     make_float3(_S68) * (*dpsh_0).primal_0.data_0[int(11)] +
	     make_float3(_S73) * (*dpsh_0).primal_0.data_0[int(12)] +
	     make_float3(_S76) * (*dpsh_0).primal_0.data_0[int(13)] +
	     make_float3(_S79) * (*dpsh_0).primal_0.data_0[int(14)] +
	     make_float3(_S83) * (*dpsh_0).primal_0.data_0[int(15)]);
	(&_S87)->differential_0 = _S86;
	DiffPair_vectorx3Cfloatx2C3x3E_0 _S88;
	(&_S88)->primal_0 = _S85;
	(&_S88)->differential_0 = _S86;
	s_bwd_prop_max_0(&_S87, &_S88, _s_dOut_0);
	float3 _S89 = _S84 * _S87.differential_0;
	float3 _S90 = (*dpsh_0).primal_0.data_0[int(15)] * _S87.differential_0;
	float _S91 = _S90.x + _S90.y + _S90.z;
	float _S92 = _S81 * _S91;
	float3 _S93 = _S80 * _S87.differential_0;
	float3 _S94 = (*dpsh_0).primal_0.data_0[int(14)] * _S87.differential_0;
	float _S95 = _S94.x + _S94.y + _S94.z;
	float3 _S96 = _S77 * _S87.differential_0;
	float3 _S97 = (*dpsh_0).primal_0.data_0[int(13)] * _S87.differential_0;
	float _S98 = _S97.x + _S97.y + _S97.z;
	float3 _S99 = _S74 * _S87.differential_0;
	float3 _S100 = (*dpsh_0).primal_0.data_0[int(12)] * _S87.differential_0;
	float _S101 = _S100.x + _S100.y + _S100.z;
	float _S102 = _S70 * _S101;
	float _S103 = -_S102;
	float3 _S104 = _S69 * _S87.differential_0;
	float3 _S105 = (*dpsh_0).primal_0.data_0[int(11)] * _S87.differential_0;
	float _S106 = _S105.x + _S105.y + _S105.z;
	float _S107 = _S75 * _S98 + _S66 * _S106;
	float _S108 = -_S107;
	float3 _S109 = _S65 * _S87.differential_0;
	float3 _S110 = (*dpsh_0).primal_0.data_0[int(10)] * _S87.differential_0;
	float _S111 = _S110.x + _S110.y + _S110.z;
	float3 _S112 = _S62 * _S87.differential_0;
	float3 _S113 = (*dpsh_0).primal_0.data_0[int(9)] * _S87.differential_0;
	float _S114 = _S113.x + _S113.y + _S113.z;
	float _S115 = _S58 * _S114;
	float3 _S116 = _S57 * _S87.differential_0;
	float3 _S117 = (*dpsh_0).primal_0.data_0[int(8)] * _S87.differential_0;
	float _S118 = _S78 * _S95 + 0.54627424478530884f * (_S117.x + _S117.y + _S117.z);
	float3 _S119 = _S54 * _S87.differential_0;
	float3 _S120 = (*dpsh_0).primal_0.data_0[int(7)] * _S87.differential_0;
	float s_diff_xz_T_0 = -1.09254848957061768f * (_S120.x + _S120.y + _S120.z);
	float3 _S121 = _S52 * _S87.differential_0;
	float3 _S122 = (*dpsh_0).primal_0.data_0[int(6)] * _S87.differential_0;
	float _S123 = 0.31539157032966614f * (_S122.x + _S122.y + _S122.z);
	float _S124 = -_S123;
	float3 _S125 = _S49 * _S87.differential_0;
	float3 _S126 = (*dpsh_0).primal_0.data_0[int(5)] * _S87.differential_0;
	float s_diff_yz_T_0 = -1.09254848957061768f * (_S126.x + _S126.y + _S126.z);
	float3 _S127 = _S47 * _S87.differential_0;
	float3 _S128 = (*dpsh_0).primal_0.data_0[int(4)] * _S87.differential_0;
	float3 _S129 = -_S87.differential_0;
	float3 _S130 = _S45 * _S129;
	float3 _S131 = (*dpsh_0).primal_0.data_0[int(3)] * _S129;
	float3 _S132 = _S43 * _S87.differential_0;
	float3 _S133 = (*dpsh_0).primal_0.data_0[int(2)] * _S87.differential_0;
	float3 _S134 = _S41 * _S87.differential_0;
	float3 _S135 = (*dpsh_0).primal_0.data_0[int(1)] * _S87.differential_0;
	float _S136 = 2.89061141014099121f * (z_0 * _S111) + 1.09254848957061768f * (_S128.x + _S128.y + _S128.z);
	float _S137 = z_0 * (4.0f * _S107 + 2.0f * (_S102 + _S123));
	float _S138 = y_3 * (3.0f * (-_S92 + _S103) + _S108 + -_S115 + -_S118 + _S124);
	float _S139 = x_7 * (_S92 + _S108 + 3.0f * (_S103 + _S115) + _S118 + _S124);
	float _S140 = 1.44530570507049561f * (_S55 * _S95) + 0.37317633628845215f * (_S72 * _S101) + _S63 * _S111 +
	              0.48860251903533936f * (_S133.x + _S133.y + _S133.z) + x_7 * s_diff_xz_T_0 + y_3 * s_diff_yz_T_0 +
	              _S137 + _S137;
	float _S141 = -0.4570457935333252f * (_S67 * _S106) + -0.59004360437393188f * (_S60 * _S114) +
	              -0.48860251903533936f * (_S135.x + _S135.y + _S135.z) + z_0 * s_diff_yz_T_0 + x_7 * _S136 + _S138 +
	              _S138;
	float _S142 = -0.59004360437393188f * (_S82 * _S91) + -0.4570457935333252f * (_S67 * _S98) +
	              0.48860251903533936f * (_S131.x + _S131.y + _S131.z) + z_0 * s_diff_xz_T_0 + y_3 * _S136 + _S139 +
	              _S139;
	float3 _S143 = make_float3(0.282094806432724f) * _S87.differential_0;
	FixedArray<float3, 16> _S144;
	_S144[int(0)] = _S86;
	_S144[int(1)] = _S86;
	_S144[int(2)] = _S86;
	_S144[int(3)] = _S86;
	_S144[int(4)] = _S86;
	_S144[int(5)] = _S86;
	_S144[int(6)] = _S86;
	_S144[int(7)] = _S86;
	_S144[int(8)] = _S86;
	_S144[int(9)] = _S86;
	_S144[int(10)] = _S86;
	_S144[int(11)] = _S86;
	_S144[int(12)] = _S86;
	_S144[int(13)] = _S86;
	_S144[int(14)] = _S86;
	_S144[int(15)] = _S86;
	_S144[int(15)] = _S89;
	_S144[int(14)] = _S93;
	_S144[int(13)] = _S96;
	_S144[int(12)] = _S99;
	_S144[int(11)] = _S104;
	_S144[int(10)] = _S109;
	_S144[int(9)] = _S112;
	_S144[int(8)] = _S116;
	_S144[int(7)] = _S119;
	_S144[int(6)] = _S121;
	_S144[int(5)] = _S125;
	_S144[int(4)] = _S127;
	_S144[int(3)] = _S130;
	_S144[int(2)] = _S132;
	_S144[int(1)] = _S134;
	_S144[int(0)] = _S143;
	float3 _S145 = make_float3(_S142, _S141, _S140);
	dpdir_0->primal_0 = (*dpdir_0).primal_0;
	dpdir_0->differential_0 = _S145;
	SH_0 _S146 = SH_x24_syn_dzero_0();
	(&_S146)->data_0 = _S144;
	dpsh_0->primal_0 = (*dpsh_0).primal_0;
	dpsh_0->differential_0 = _S146;
	return;
}
__device__ void s_bwd_prop_sqrt_0(DiffPair_float_0 *_S147, float _S148) {
	_d_sqrt_0(_S147, _S148);
	return;
}
__device__ void s_bwd_prop_length_impl_0(DiffPair_vectorx3Cfloatx2C3x3E_0 *dpx_5, float _s_dOut_1) {
	float _S149 = (*dpx_5).primal_0.x;
	float _S150 = (*dpx_5).primal_0.y;
	float _S151 = (*dpx_5).primal_0.z;
	DiffPair_float_0 _S152;
	(&_S152)->primal_0 = _S149 * _S149 + _S150 * _S150 + _S151 * _S151;
	(&_S152)->differential_0 = 0.0f;
	s_bwd_prop_sqrt_0(&_S152, _s_dOut_1);
	float _S153 = (*dpx_5).primal_0.z * _S152.differential_0;
	float _S154 = _S153 + _S153;
	float _S155 = (*dpx_5).primal_0.y * _S152.differential_0;
	float _S156 = _S155 + _S155;
	float _S157 = (*dpx_5).primal_0.x * _S152.differential_0;
	float _S158 = _S157 + _S157;
	float3 _S159 = make_float3(0.0f);
	*&((&_S159)->z) = _S154;
	*&((&_S159)->y) = _S156;
	*&((&_S159)->x) = _S158;
	dpx_5->primal_0 = (*dpx_5).primal_0;
	dpx_5->differential_0 = _S159;
	return;
}
__device__ void s_bwd_length_impl_0(DiffPair_vectorx3Cfloatx2C3x3E_0 *_S160, float _S161) {
	s_bwd_prop_length_impl_0(_S160, _S161);
	return;
}
__device__ void s_bwd_prop_normalize_impl_0(DiffPair_vectorx3Cfloatx2C3x3E_0 *dpx_6, float3 _s_dOut_2) {
	float _S162 = length_0((*dpx_6).primal_0);
	float3 _S163 = (*dpx_6).primal_0 * _s_dOut_2;
	float3 _S164 = make_float3(1.0f / _S162) * _s_dOut_2;
	float _S165 = -((_S163.x + _S163.y + _S163.z) / (_S162 * _S162));
	float3 _S166 = make_float3(0.0f);
	DiffPair_vectorx3Cfloatx2C3x3E_0 _S167;
	(&_S167)->primal_0 = (*dpx_6).primal_0;
	(&_S167)->differential_0 = _S166;
	s_bwd_length_impl_0(&_S167, _S165);
	float3 _S168 = _S164 + _S167.differential_0;
	dpx_6->primal_0 = (*dpx_6).primal_0;
	dpx_6->differential_0 = _S168;
	return;
}
__device__ void s_bwd_normalize_impl_0(DiffPair_vectorx3Cfloatx2C3x3E_0 *_S169, float3 _S170) {
	s_bwd_prop_normalize_impl_0(_S169, _S170);
	return;
}
__device__ void s_bwd_prop_cov2conic_0(DiffPair_vectorx3Cfloatx2C3x3E_0 *dpcov_0, float3 _s_dOut_3) {
	float _S171 = (*dpcov_0).primal_0.x;
	float _S172 = (*dpcov_0).primal_0.z;
	float _S173 = (*dpcov_0).primal_0.y;
	float det_0 = _S171 * _S172 - _S173 * _S173;
	float3 _S174 = _s_dOut_3 / make_float3(det_0 * det_0);
	float3 _S175 = make_float3(_S172, -_S173, _S171) * -_S174;
	float3 _S176 = make_float3(det_0) * _S174;
	float _S177 = _S175.x + _S175.y + _S175.z;
	float _S178 = _S173 * -_S177;
	float3 _S179 = make_float3(_S176.z + _S172 * _S177, -_S176.y + _S178 + _S178, _S176.x + _S171 * _S177);
	dpcov_0->primal_0 = (*dpcov_0).primal_0;
	dpcov_0->differential_0 = _S179;
	return;
}
__device__ void s_bwd_prop_mul_0(DiffPair_matrixx3Cfloatx2C3x2C3x3E_0 *_S180,
                                 DiffPair_matrixx3Cfloatx2C3x2C3x3E_0 *_S181, Matrix<float, 3, 3> _S182) {
	mul_1(_S180, _S181, _S182);
	return;
}
struct DiffPair_vectorx3Cfloatx2C4x3E_0 {
	float4 primal_0;
	float4 differential_0;
};
__device__ void s_bwd_prop_quat2matrix_0(DiffPair_vectorx3Cfloatx2C4x3E_0 *dpquat_1, Matrix<float, 3, 3> _s_dOut_4) {
	float _S183 = 2.0f * -_s_dOut_4.rows[int(2)].z;
	float _S184 = 2.0f * _s_dOut_4.rows[int(2)].y;
	float _S185 = 2.0f * _s_dOut_4.rows[int(2)].x;
	float _S186 = 2.0f * _s_dOut_4.rows[int(1)].z;
	float _S187 = _S184 + -_S186;
	float _S188 = _S184 + _S186;
	float _S189 = 2.0f * -_s_dOut_4.rows[int(1)].y;
	float _S190 = (*dpquat_1).primal_0.y * (_S183 + _S189);
	float _S191 = 2.0f * _s_dOut_4.rows[int(1)].x;
	float _S192 = 2.0f * _s_dOut_4.rows[int(0)].z;
	float _S193 = -_S185 + _S192;
	float _S194 = _S185 + _S192;
	float _S195 = 2.0f * _s_dOut_4.rows[int(0)].y;
	float _S196 = _S191 + -_S195;
	float _S197 = _S191 + _S195;
	float _S198 = 2.0f * -_s_dOut_4.rows[int(0)].x;
	float _S199 = (*dpquat_1).primal_0.w * (_S189 + _S198);
	float _S200 = (*dpquat_1).primal_0.z * (_S183 + _S198);
	float _S201 = (*dpquat_1).primal_0.y * _S187 + (*dpquat_1).primal_0.z * _S193 + (*dpquat_1).primal_0.w * _S196;
	float _S202 = (*dpquat_1).primal_0.z * _S188 + (*dpquat_1).primal_0.y * _S194 + (*dpquat_1).primal_0.x * _S196 +
	              _S199 + _S199;
	float _S203 = (*dpquat_1).primal_0.w * _S188 + (*dpquat_1).primal_0.x * _S193 + (*dpquat_1).primal_0.y * _S197 +
	              _S200 + _S200;
	float _S204 = (*dpquat_1).primal_0.x * _S187 + _S190 + _S190 + (*dpquat_1).primal_0.w * _S194 +
	              (*dpquat_1).primal_0.z * _S197;
	float4 _S205 = make_float4(0.0f);
	*&((&_S205)->x) = _S201;
	*&((&_S205)->w) = _S202;
	*&((&_S205)->z) = _S203;
	*&((&_S205)->y) = _S204;
	dpquat_1->primal_0 = (*dpquat_1).primal_0;
	dpquat_1->differential_0 = _S205;
	return;
}
__device__ void s_bwd_prop_scale2matrix_0(DiffPair_vectorx3Cfloatx2C3x3E_0 *dpscale_1, Matrix<float, 3, 3> _s_dOut_5) {
	float3 _S206 = make_float3(_s_dOut_5.rows[int(0)].x, _s_dOut_5.rows[int(1)].y, _s_dOut_5.rows[int(2)].z);
	dpscale_1->primal_0 = (*dpscale_1).primal_0;
	dpscale_1->differential_0 = _S206;
	return;
}
__device__ void s_bwd_prop_clamp_0(DiffPair_vectorx3Cfloatx2C2x3E_0 *_S207, DiffPair_vectorx3Cfloatx2C2x3E_0 *_S208,
                                   DiffPair_vectorx3Cfloatx2C2x3E_0 *_S209, float2 _S210) {
	_d_clamp_vector_0(_S207, _S208, _S209, _S210);
	return;
}
__device__ void s_bwd_prop_mul_1(DiffPair_matrixx3Cfloatx2C3x2C3x3E_0 *_S211, DiffPair_vectorx3Cfloatx2C3x3E_0 *_S212,
                                 float3 _S213) {
	_d_mul_0(_S211, _S212, _S213);
	return;
}
__device__ void s_bwd_prop_splat2splatView_0(DiffPair_Splat_0 *dpsplat_0, Camera_0 camera_0, SplatView_0 _s_dOut_6) {
	float3 camMean_0 = (*dpsplat_0).primal_0.geom_1.mean_0 - camera_0.pos_0;
	float3 _S214 = s_primal_ctx_mul_0(camera_0.viewMat_0, camMean_0);
	float _S215 = _S214.z;
	float invViewMeanZ_0 = 1.0f / _S215;
	float2 _S216 = make_float2(invViewMeanZ_0);
	float _S217 = _S215 * _S215;
	float2 _S218 = float2{_S214.x, _S214.y} * camera_0.focal_0;
	float2 projMean_0 = _S218 * make_float2(invViewMeanZ_0);
	uint2 _S219 = camera_0.resolution_0;
	float2 _S220 = make_float2((float)_S219.x, (float)_S219.y);
	float2 camHalfRes_0 = _S220 * make_float2(0.5f);
	float2 _S221 = make_float2(-1.29999995231628418f) * camHalfRes_0;
	float2 _S222 = make_float2(1.29999995231628418f) * camHalfRes_0;
	float2 _S223 = s_primal_ctx_clamp_0(projMean_0, _S221, _S222);
	Matrix<float, 3, 3> _S224 = s_primal_ctx_scale2matrix_0((*dpsplat_0).primal_0.geom_1.scale_0);
	Matrix<float, 3, 3> _S225 = s_primal_ctx_quat2matrix_0((*dpsplat_0).primal_0.geom_1.quat_0);
	float _S226 = camera_0.focal_0.x;
	float _S227 = -_S223.x;
	float _S228 = camera_0.focal_0.y;
	float _S229 = -_S223.y;
	Matrix<float, 3, 3> J_0 = makeMatrix<float, 3, 3>(make_float3(_S226 * invViewMeanZ_0, 0.0f, _S227 * invViewMeanZ_0),
	                                                  make_float3(0.0f, _S228 * invViewMeanZ_0, _S229 * invViewMeanZ_0),
	                                                  make_float3(0.0f, 0.0f, 0.0f));
	Matrix<float, 3, 3> _S230 = s_primal_ctx_mul_1(J_0, camera_0.viewMat_0);
	Matrix<float, 3, 3> _S231 = s_primal_ctx_mul_1(_S225, _S224);
	Matrix<float, 3, 3> _S232 = s_primal_ctx_mul_1(_S230, _S231);
	Matrix<float, 3, 3> _S233 = transpose_0(_S232);
	Matrix<float, 3, 3> _S234 = s_primal_ctx_mul_1(_S232, _S233);
	Matrix<float, 2, 2> _S235 = makeMatrix<float, 2, 2>(float2{_S234.rows[int(0)].x, _S234.rows[int(0)].y},
	                                                    float2{_S234.rows[int(1)].x, _S234.rows[int(1)].y});
	float3 cov2D_0 = make_float3(_S235.rows[int(0)].x, _S235.rows[int(0)].y, _S235.rows[int(1)].y) +
	                 make_float3(0.30000001192092896f, 0.0f, 0.30000001192092896f);
	float3 _S236 = normalize_0(camMean_0);
	SH_0 _S237 = SH_x24_syn_dzero_0();
	DiffPair_SH_0 _S238;
	(&_S238)->primal_0 = (*dpsplat_0).primal_0.sh_0;
	(&_S238)->differential_0 = _S237;
	float3 _S239 = make_float3(0.0f);
	DiffPair_vectorx3Cfloatx2C3x3E_0 _S240;
	(&_S240)->primal_0 = _S236;
	(&_S240)->differential_0 = _S239;
	s_bwd_prop_sh2color_0(&_S238, &_S240, _s_dOut_6.color_0);
	DiffPair_vectorx3Cfloatx2C3x3E_0 _S241;
	(&_S241)->primal_0 = camMean_0;
	(&_S241)->differential_0 = _S239;
	s_bwd_normalize_impl_0(&_S241, _S240.differential_0);
	DiffPair_vectorx3Cfloatx2C3x3E_0 _S242;
	(&_S242)->primal_0 = cov2D_0;
	(&_S242)->differential_0 = _S239;
	s_bwd_prop_cov2conic_0(&_S242, _s_dOut_6.geom_0.conic_0);
	float2 _S243 = make_float2(0.0f);
	float2 _S244 = _S243;
	*&((&_S244)->y) = _S242.differential_0.z;
	float2 _S245 = _S243;
	*&((&_S245)->y) = _S242.differential_0.y;
	*&((&_S245)->x) = _S242.differential_0.x;
	Matrix<float, 2, 2> _S246 = makeMatrix<float, 2, 2>(0.0f);
	_S246[int(1)] = _S244;
	_S246[int(0)] = _S245;
	float3 _S247 = make_float3(_S246.rows[int(1)].x, _S246.rows[int(1)].y, 0.0f);
	float3 _S248 = make_float3(_S246.rows[int(0)].x, _S246.rows[int(0)].y, 0.0f);
	Matrix<float, 3, 3> _S249 = makeMatrix<float, 3, 3>(0.0f);
	Matrix<float, 3, 3> _S250 = _S249;
	_S250[int(1)] = _S247;
	_S250[int(0)] = _S248;
	DiffPair_matrixx3Cfloatx2C3x2C3x3E_0 _S251;
	(&_S251)->primal_0 = _S232;
	(&_S251)->differential_0 = _S249;
	DiffPair_matrixx3Cfloatx2C3x2C3x3E_0 _S252;
	(&_S252)->primal_0 = _S233;
	(&_S252)->differential_0 = _S249;
	s_bwd_prop_mul_0(&_S251, &_S252, _S250);
	Matrix<float, 3, 3> _S253 = _S251.differential_0 + transpose_0(_S252.differential_0);
	DiffPair_matrixx3Cfloatx2C3x2C3x3E_0 _S254;
	(&_S254)->primal_0 = _S230;
	(&_S254)->differential_0 = _S249;
	DiffPair_matrixx3Cfloatx2C3x2C3x3E_0 _S255;
	(&_S255)->primal_0 = _S231;
	(&_S255)->differential_0 = _S249;
	s_bwd_prop_mul_0(&_S254, &_S255, _S253);
	DiffPair_matrixx3Cfloatx2C3x2C3x3E_0 _S256;
	(&_S256)->primal_0 = _S225;
	(&_S256)->differential_0 = _S249;
	DiffPair_matrixx3Cfloatx2C3x2C3x3E_0 _S257;
	(&_S257)->primal_0 = _S224;
	(&_S257)->differential_0 = _S249;
	s_bwd_prop_mul_0(&_S256, &_S257, _S255.differential_0);
	DiffPair_matrixx3Cfloatx2C3x2C3x3E_0 _S258;
	(&_S258)->primal_0 = J_0;
	(&_S258)->differential_0 = _S249;
	DiffPair_matrixx3Cfloatx2C3x2C3x3E_0 _S259;
	(&_S259)->primal_0 = camera_0.viewMat_0;
	(&_S259)->differential_0 = _S249;
	s_bwd_prop_mul_0(&_S258, &_S259, _S254.differential_0);
	float _S260 = _S229 * _S258.differential_0.rows[int(1)].z;
	float _S261 = -(invViewMeanZ_0 * _S258.differential_0.rows[int(1)].z);
	float _S262 = _S228 * _S258.differential_0.rows[int(1)].y;
	float _S263 = _S227 * _S258.differential_0.rows[int(0)].z;
	float _S264 = -(invViewMeanZ_0 * _S258.differential_0.rows[int(0)].z);
	float _S265 = _S226 * _S258.differential_0.rows[int(0)].x;
	float4 _S266 = make_float4(0.0f);
	DiffPair_vectorx3Cfloatx2C4x3E_0 _S267;
	(&_S267)->primal_0 = (*dpsplat_0).primal_0.geom_1.quat_0;
	(&_S267)->differential_0 = _S266;
	s_bwd_prop_quat2matrix_0(&_S267, _S256.differential_0);
	DiffPair_vectorx3Cfloatx2C3x3E_0 _S268;
	(&_S268)->primal_0 = (*dpsplat_0).primal_0.geom_1.scale_0;
	(&_S268)->differential_0 = _S239;
	s_bwd_prop_scale2matrix_0(&_S268, _S257.differential_0);
	float2 _S269 = make_float2(_S264, _S261);
	DiffPair_vectorx3Cfloatx2C2x3E_0 _S270;
	(&_S270)->primal_0 = projMean_0;
	(&_S270)->differential_0 = _S243;
	DiffPair_vectorx3Cfloatx2C2x3E_0 _S271;
	(&_S271)->primal_0 = _S221;
	(&_S271)->differential_0 = _S243;
	DiffPair_vectorx3Cfloatx2C2x3E_0 _S272;
	(&_S272)->primal_0 = _S222;
	(&_S272)->differential_0 = _S243;
	s_bwd_prop_clamp_0(&_S270, &_S271, &_S272, _S269);
	float2 _S273 = _s_dOut_6.geom_0.mean2D_0 + _S270.differential_0;
	float2 _S274 = _S218 * _S273;
	float2 _S275 = camera_0.focal_0 * (_S216 * _S273);
	float3 _S276 = make_float3(_S275.x, _S275.y, -((_S260 + _S262 + _S263 + _S265 + _S274.x + _S274.y) / _S217));
	DiffPair_matrixx3Cfloatx2C3x2C3x3E_0 _S277;
	(&_S277)->primal_0 = camera_0.viewMat_0;
	(&_S277)->differential_0 = _S249;
	DiffPair_vectorx3Cfloatx2C3x3E_0 _S278;
	(&_S278)->primal_0 = camMean_0;
	(&_S278)->differential_0 = _S239;
	s_bwd_prop_mul_1(&_S277, &_S278, _S276);
	float3 _S279 = _S241.differential_0 + _S278.differential_0;
	SplatGeom_0 _S280 = SplatGeom_x24_syn_dzero_0();
	(&_S280)->opacity_1 = _s_dOut_6.geom_0.opacity_0;
	(&_S280)->quat_0 = _S267.differential_0;
	(&_S280)->scale_0 = _S268.differential_0;
	(&_S280)->mean_0 = _S279;
	Splat_0 _S281 = Splat_x24_syn_dzero_0();
	(&_S281)->sh_0 = _S238.differential_0;
	(&_S281)->geom_1 = _S280;
	dpsplat_0->primal_0 = (*dpsplat_0).primal_0;
	dpsplat_0->differential_0 = _S281;
	return;
}
__device__ void s_bwd_splat2splatView_0(DiffPair_Splat_0 *_S282, Camera_0 _S283, SplatView_0 _S284) {
	s_bwd_prop_splat2splatView_0(_S282, _S283, _S284);
	return;
}
__device__ Splat_0 bwd_splat2splatView_0(Splat_0 splat_0, Camera_0 camera_1, SplatView_0 dL_dsplatView_0) {
	Splat_0 _S285 = Splat_x24_syn_dzero_0();
	DiffPair_Splat_0 dp_0;
	(&dp_0)->primal_0 = splat_0;
	(&dp_0)->differential_0 = _S285;
	s_bwd_splat2splatView_0(&dp_0, camera_1, dL_dsplatView_0);
	return dp_0.differential_0;
}
} // namespace math