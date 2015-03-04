package merge_sort_test

import (
	"sort"

	. "github.com/daviskoh/intro_to_algorithms/lectures/1/merge_sort"

	. "github.com/onsi/ginkgo"
	. "github.com/onsi/gomega"
)

/**
 * func([]int) []int
 * func that takes slice of integers & returns it sorted
 */

func shouldBeSorted(slice []int) {
	result := make([]int, len(slice))
	copy(result, slice)

	// sort result
	sort.Sort(sort.IntSlice(result))
	Expect(MergeSort(slice)).To(Equal(result))
}

var _ = Describe("MergeSort", func() {
	var slice []int

	It("should handle an empty slice", func() {
		// input
		slice = []int{}

		shouldBeSorted(slice)
	})

	XIt("should handle a single value", func() {

	})
})
